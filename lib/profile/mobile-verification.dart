import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobileVerification extends StatefulWidget {
  @override
  _MobileVerificationState createState() => _MobileVerificationState();
}

class _MobileVerificationState extends State<MobileVerification> {
  Widget _getCodeFeilds() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      child: SizedBox(
        width: 40,
        child: TextFormField(
          decoration: InputDecoration(labelText: null,),
          style: TextStyle(fontSize: 18,),
          keyboardType: TextInputType.number,
          // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
        ),
      ),
    );
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
          title: Text(
              'Mobile Verification',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.all(30),
               // padding: EdgeInsets.all(30),
                child: Card(
                    child: Padding(padding: EdgeInsets.all(30),
                      child: Column(
              children: <Widget>[
                Text('Mobile Verification Code ', style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _getCodeFeilds(),
                    _getCodeFeilds(),
                    _getCodeFeilds(),
                    _getCodeFeilds(),

                  ],
                )
              ],
            )
                    
                    ),
                    )),
          ],
        )));
  }
}
