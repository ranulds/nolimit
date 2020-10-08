import 'package:flutter/material.dart';
import 'package:nolimit/gallery/gallery.dart';
import 'package:nolimit/wishlist/wishlist.dart';

import 'package:nolimit/profile/main-profile.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  int _selectedIndex = 2;
  Widget feildsWithPadding(String title, double topVal, double bottomVal) {
    return Padding(
      padding: EdgeInsets.only(top: topVal, bottom: bottomVal),
      child: TextFormField(
        decoration: InputDecoration(labelText: title),
        obscureText: true,
      ),
    );
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
          backgroundColor: Colors.white,
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
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
        primary: false,
        body: Container(
            margin: EdgeInsets.all(30),
            // height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                    elevation: 8.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 30, bottom: 20, right: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'New Password'),
                              obscureText: true,
                            ),
                            feildsWithPadding('Current Password', 10, 10),
                            feildsWithPadding('Confirm Password', 10, 30),
                          ]),
                    )),
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
                      Navigator.of(context).pop();
                    },
                    color: Colors.black87,
                    padding:
                        EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                )
              ],
            )));
  }
}
