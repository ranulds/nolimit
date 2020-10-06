import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
                  child: Padding(padding: const EdgeInsets.only(top: 20, left: 30, bottom: 20, right: 10),
                    child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Current Password'),
                  obscureText: true,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'New Password'),
                  obscureText: true,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                ),
              ]),
                  )),
                  
            ],
          )
          //), remved due to exceptions
        ));
  }
}
