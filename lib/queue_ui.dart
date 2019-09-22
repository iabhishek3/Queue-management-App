import 'package:flutter/material.dart';
import 'dart:convert';
import 'service/http-data.dart' as Apphttp;
import 'dto/queue_dto.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void initState(){
    super.initState();
    initPlatformState();
             }

   Future<void> initPlatformState() async {
    IO.Socket socket = IO.io('http://192.168.120.14:9092');
    socket.on('connect', (_) {
     print('connect::::>>>');
     socket.emit('msg', 'test');
    });
    socket.on('event', (data) => print(data));
    socket.on('disconnect', (_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));


   }
    

  Future<Null> _handleRefresh() async {
    await new Future.delayed(new Duration(seconds: 3));

    setState(() {
    getListQueue();
    });

    return null;
  }
  List<Queue> list=[];
  getListQueue() async {
  
   list=[];
    var url = "https://zuulqa.sdglobaltech.com/graphql-service/graphql";

    Map data = {
      "operationName": null,
      "variables": {},
      "query":
          "{\n  queues { mrn\n    patientNm\n    roomNo\n    sequenceNumber\n    status\n    tokenNo\n    datetime\n    __typename\n  }\n}\n"
    };
    var body = json.encode(data);

    var responseData =
        await Apphttp.ApplicationHttpserive().postGeneric(url, body);

    list = responseData.data.queues;

    print(list);
    return responseData.data.queues;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Queue"),
        backgroundColor: new Color(0xFF37ac94),
        centerTitle: true,
        automaticallyImplyLeading:false
      ),
      body: RefreshIndicator(child: Container(
        color: Colors.teal[50],
        child: FutureBuilder(
            future: getListQueue(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null || snapshot.data.length == 0) {
                print("no data");
                return Center(
                  child: Text("No Patient for the Day!!"),
                );
              } else {
                print("yes data");
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    padding: const EdgeInsets.all(6.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        child: Card(
                        
                        child:  ListTile(
                          
                        leading: Icon(Icons.account_circle,size:36.0),
                        title: Text(
                          snapshot.data[index].patientNm,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          snapshot.data[index].mrn,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ), key: UniqueKey() ,
                      background: Container(
                        child:Container(
                           alignment: Alignment.centerLeft,child: Icon(Icons.call,size:28.0),),
                        color: Colors.green),
                      secondaryBackground:Container(color: Colors.red) ,
                      
                      
                      );
                    });
              }
            }),
      ),
      onRefresh: _handleRefresh
      ),
    );
  }
}
