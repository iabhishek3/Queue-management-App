import 'package:flutter/material.dart';

class PatientUI extends StatefulWidget {
  @override
  _PatientUIState createState() => _PatientUIState();
}

class _PatientUIState extends State<PatientUI>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          //  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          color: Colors.redAccent,
          width: 400.0,
          height: 190.0,
          child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 0),
                  child: Image(
                    image: AssetImage('assets/medcare.png'),
                    height: 140.0,
                    width: 160.0,
                  )),
            ],
          ),
        ),
        Container(
          width: 400.0,
          height: 100.0,
          //  color: Colors.green,
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  "Hi Harry,",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                padding: const EdgeInsets.fromLTRB(20.0, 30.0, 0, 0),
              ),
              Container(
                child: Text(
                  "Thank you for Waiting",
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
             
            ],
          ),
        ),
         Container(
                  width: 100.0,
                 height: 40.0,
                 child: Image(
                    image: AssetImage('assets/dot.png'),
                  
                  ),
                  ),
          Container(
              width: 200.0,
                 height: 80.0,
          child: Column(children: <Widget>[
            Container(
            //     width: 200.0,
            // height: 40.0,
            child: Text("Here is postion",
            style: TextStyle(fontSize: 16.0),),
            ),
                Container(
            padding: const EdgeInsets.fromLTRB(40.0, 0.0, 0, 0),
            width: 180.0,
            height: 40.0,
            child: Text("in the Queue",
            style: TextStyle(fontSize: 16.0),),
            ),
          ],),
          ),
      Container(
         child: ClipOval(
          child: Container(
            color: Colors.black,
            height: 150.0, // height of the button
            width: 150.0, // width of the button
            child: Center(child: Text('TOKEN-PRW1002',style: TextStyle(color: Colors.white,
            fontSize: 14.0, fontWeight: FontWeight.bold))),
          ),
        ),
      ),Container(
        width: 250.0,
                 height: 150.0,
                 padding: const EdgeInsets.fromLTRB(35.0, 40.0, 0, 0),
          child: Column(children: <Widget>[
            Container(
                width: 240.0,
             height: 25.0,
            child: Text("We wil text you when we're",
            style: TextStyle(fontSize: 16.0),),
            ),
                Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
            width: 240.0,
            height: 60.0,
            child: Text("almost ready to see you.",
            style: TextStyle(fontSize: 16.0),),
            ),
          ],),)
      ],
    ));
  }
}
