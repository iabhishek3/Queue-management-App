import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();


    void login() {

    if(username.text=='Admin' && username.text=="Admin"){
      Navigator.of(context).pushNamed('/queuelist');
    }if(username.text=='mrn' && username.text=="mrn"){


    Navigator.of(context).pushNamed('/patient');
    } 
    else {
      
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Warning"),
          content: new Text("Please Enter Valid Details."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
    

    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                // margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 0),
                width: 300.0,
                height: 250.0,
                child: Image(
                  image: AssetImage('assets/medcare.png'),
                  // width: 100.0,
                  // height: 100.0,
                )),
            Container(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: username,
                      decoration: InputDecoration(
                          labelText: 'User Name',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: password,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: new Color(0xFF37ac94),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 65.0),
                     Container(
              height: 45,
              width: double.maxFinite,
              // decoration: BoxDecoration(
              //   color: Colors.deepPurpleAccent,
              //   borderRadius: BorderRadius.all(Radius.circular(32)),
              // ),
              child: RaisedButton(
                // onPressed: null,
                // textColor: Colors.white,
                // child: Text('Disabled Button',
                //     style: TextStyle(fontSize: 20)),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: const Text('Connect with App'),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                splashColor: Colors.blueGrey,
                onPressed: ()  {

                  login();
                                    
                                  },
                                ),
                              ),
                                      SizedBox(height: 20.0),
                                      Container(
                                        height: 40.0,
                                        color: Colors.transparent,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  style: BorderStyle.solid,
                                                  width: 1.0),
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.circular(20.0)),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Center(
                                                child:
                                                    ImageIcon(AssetImage('assets/facebook.png')),
                                              ),
                                              SizedBox(width: 10.0),
                                              Center(
                                                child: Text('Log in with facebook',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily: 'Montserrat')),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              SizedBox(height: 15.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'New to App ?',
                                    style: TextStyle(fontFamily: 'Montserrat'),
                                  ),
                                  SizedBox(width: 5.0),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed('/signup');
                                    },
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                          color: new Color(0xFF37ac94),
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                          );
                    }
                  
                
}
