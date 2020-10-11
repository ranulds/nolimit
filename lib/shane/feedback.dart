import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:nolimit/profile/main-profile.dart';
import 'package:nolimit/util/base.dart';
import 'package:nolimit/gallery/gallery.dart';
import 'package:nolimit/shane/notifications.dart';
import 'package:nolimit/util/drawer.dart';
import 'package:nolimit/wishlist/wishlist.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends BaseState<FeedBack> {
  int _selectedIndex = 1;
  final _formKey = GlobalKey<FormState>();

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

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Feedback sent!!'),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
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
        selectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
      primary: false,
      appBar: AppBar(
        primary: false,
        elevation: 4,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Feedback', style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              size: 30,
            ),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Notifications())),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'How was your experience',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: RatingBar(
                  rating: 0,
                  icon: Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.grey,
                  ),
                  starCount: 5,
                  spacing: 5.0,
                  size: 40,
                  isIndicator: false,
                  allowHalfRating: true,
                  onRatingCallback:
                      (double value, ValueNotifier<bool> isIndicator) {
                    //change the isIndicator from false  to true ,the RatingBar cannot support touch event;
                    isIndicator.value = false;
                  },
                  color: Colors.amber,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Comment',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration:
                        InputDecoration(errorStyle: TextStyle(fontSize: 16)),
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    maxLength: 1000,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your feedback';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              // Center(
              //   child: RaisedButton(
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20)),
              //     color: Colors.cyan,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Icon(Icons.send),
              //         SizedBox(
              //           width: 5,
              //         ),
              //         Text('Send'),
              //       ],
              //     ),
              //     onPressed: () {
              //       FocusScope.of(context).unfocus();
              //       if (_formKey.currentState.validate()) {
              //         showAlert(context);
              //       }
              //     },
              //   ),
              // ),
              // Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                child: RaisedButton(
                  child: Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState.validate()) {
                      showAlert(context);
                    }
                  },
                  color: Colors.black87,
                  padding: EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
