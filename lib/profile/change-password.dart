import 'package:flutter/material.dart';
import 'package:nolimit/gallery/gallery.dart';
import 'package:nolimit/util/base.dart';
import 'package:nolimit/wishlist/wishlist.dart';
import 'package:toast/toast.dart';
import 'package:nolimit/profile/main-profile.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends BaseState<ChangePassword> {
  final _passwordText = TextEditingController();
  final _newPasswordText = TextEditingController();
  final _confirmPasswordText = TextEditingController();
  bool _passwordValidate = true;
  bool _newPasswordValidate = true;
  bool _confirmPasswordValidate = true;
  bool _passwordMatch = true;

  int _selectedIndex = 2;
  Widget feildsWithPadding(
      String title, double topVal, double bottomVal, _text, _validate) {
    return Padding(
      padding: EdgeInsets.only(top: topVal, bottom: bottomVal),
      child: TextFormField(
        controller: _text,
        decoration: InputDecoration(
          labelText: title,
          errorText: (_validate == false) ? 'Password can\'t be empty ' : null,
          // labelStyle: new TextStyle(color: Colors.blue[900])
        ),
        obscureText: true,
      ),
    );
  }

  @override
  void dispose() {
    _passwordText.dispose();
    _newPasswordText.dispose();
    _confirmPasswordText.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0)
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => WishList()),
          (Route<dynamic> route) => false);
    else if (index == 1)
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => Gallery()),
          (Route<dynamic> route) => false);
    else if (index == 2)
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => MainProfile()));
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
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text('Change Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5.0,
         // iconSize: 30,
          backgroundColor: Colors.white,//Colors.grey[100],
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Wishlist'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text('Gallery'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[900],
          onTap: _onItemTapped,
        ),
        primary: false,
        body: SingleChildScrollView(
            // margin: EdgeInsets.all(30),
            // height: 600,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(30),
                child: Card(
                    elevation: 8.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 30, bottom: 20, right: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: _passwordText,
                              decoration: InputDecoration(
                                  labelText: 'Current Password',
                                  errorText: (_passwordValidate == false)
                                      ? 'current password can\'t be empty'
                                      : null),
                              obscureText: true,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: TextFormField(
                                controller: _newPasswordText,
                                decoration: InputDecoration(
                                  labelText: 'New Password',
                                  errorText: (_newPasswordValidate == false)
                                      ? 'password can\'t be empty '
                                      : null,
                                  // labelStyle: new TextStyle(color: Colors.blue[900])
                                ),
                                obscureText: true,
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 30),
                              child: TextFormField(
                                controller: _confirmPasswordText,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  errorText: (_confirmPasswordValidate == false)
                                      ? 'password can\'t be empty '
                                      : ((_passwordMatch == false)
                                          ? 'passwords does not match'
                                          : null),
                                  // labelStyle: new TextStyle(color: Colors.blue[900])
                                ),
                                obscureText: true,
                              ),
                            ),
                            //feildsWithPadding('New Password', 20, 10, _newPasswordText, _newPasswordValidate),
                            //feildsWithPadding('Confirm Password', 10, 30, _confirmPasswordText, _confirmPasswordValidate),
                          ]),
                    ))),
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  //_passwordMatch
                  setState(() {
                    _passwordText.text.isEmpty
                        ? _passwordValidate = false
                        : _passwordValidate = true;
                    _newPasswordText.text.isEmpty
                        ? _newPasswordValidate = false
                        : _newPasswordValidate = true;
                    _confirmPasswordText.text.isEmpty
                        ? _confirmPasswordValidate = false
                        : _confirmPasswordValidate = true;
                    (_newPasswordText.text != _confirmPasswordText.text)
                        ? _passwordMatch = false
                        : _passwordMatch = true;
                  });

                  if (_passwordValidate &&
                      _newPasswordValidate &&
                      _confirmPasswordValidate) {
                    if (_passwordMatch) {
                      Toast.show('password changed', context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                      Navigator.of(context).pop();
                    }
                  }
                },
                color: Colors.black87,
                padding: EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            )
          ],
        )));
  }
}
