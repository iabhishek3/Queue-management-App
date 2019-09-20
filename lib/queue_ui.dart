import 'package:flutter/material.dart';
import 'dart:convert';
import 'service/http-data.dart' as Apphttp;
import 'dto/queue_dto.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  getListQueue() async {
    print("i m callled");
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

    List<Queue> list = responseData.data.queues;

    print(list);
    return responseData.data.queues;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Queue"),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
            future: getListQueue(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Text("No data La!!"),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    padding: const EdgeInsets.all(6.0),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(Icons.account_circle),
                        title: Text(
                          snapshot.data[index].patientNm,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          snapshot.data[index].mrn,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      );
                    });
              }
            }),
      ),
    );
  }
}
