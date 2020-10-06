import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  Widget feildsWithPadding(String title, double topVal, double bottomVal){
    return Padding(padding: EdgeInsets.only(top: topVal, bottom: bottomVal),
                    child: TextFormField(
                      decoration:
                          InputDecoration(labelText: title),
                      obscureText: true,
                    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 35,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          primary: false,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text('Change Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: Container(
            margin: EdgeInsets.all(30),
            // child: Expanded(
            child: Column(
              children: <Widget>[
                Card(
                    
                    child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 30, bottom: 20, right: 10),
                  child: Column(children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'New Password'),
                      obscureText: true,
                    ),
                    feildsWithPadding('Current Password', 10, 10),
                    feildsWithPadding('Confirm Password', 10, 30),
                    
                  ]),
                )),
                Padding(padding: EdgeInsets.only(top: 60),
                child: RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.black87,
                  padding: EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                )
              ],
            )
            //), remved due to exceptions
            ));
  }
}
