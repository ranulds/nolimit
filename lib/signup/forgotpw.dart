import 'package:flutter/material.dart';
import 'package:nolimit/signup/signin.dart';

class fgPassword extends StatefulWidget {
  @override
  _forgotPassword createState() => _forgotPassword();
}

class _forgotPassword extends State<fgPassword> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 35,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        primary: false,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('forgot password',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            )),
      ),
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 100.0, 0.0, 0.0),
                  child: Text('Forgot your password?',
                      style: TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: 'EMAIL',
                      hintText: '(new password will be sent to this email)',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ],
            ),
          ),
          SizedBox(height: 60.0),
          Container(
            margin: const EdgeInsets.only(left: 30.0, right: 20.0),
            height: 50.0,
            width: 340.0,
            child: Material(
              borderRadius: BorderRadius.circular(50.0),
              shadowColor: Colors.black54,
              color: Colors.black,
              elevation: 7.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => SigninPage()),
                      (Route<dynamic> route) => false);
                },
                child: Center(
                  child: Text(
                    'Confirm Email',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
