import 'package:flutter/material.dart';
import 'package:nolimit/gallery/gallery.dart';
import 'package:nolimit/home/carousel.dart';
import 'package:nolimit/map/map.dart';
import 'package:nolimit/profile/main-profile.dart';
import 'package:nolimit/shane/brands.dart';
import 'package:nolimit/shane/feedback.dart';
import 'package:nolimit/signup/signin.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            accountName: Text(
              ' Hello!! Miranda Lopez',
              style: TextStyle(fontSize: 20.0),
            ),
            accountEmail: Text('miranda@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/female_woman_avatar_portrait_1-512.png'),
            ),
          ),
          new ListTile(
            title: Text(
              'Home',
              style: TextStyle(fontFamily: "Tomorrow", fontSize: 25.0),
            ),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => CarouselPage()),
                  (Route<dynamic> route) => false);
            },
          ),
          new Divider(
            color: Colors.transparent,
            height: 25.0,
          ),
          new ListTile(
            title: Text(
              'Gallery',
              style: TextStyle(
                fontFamily: "Tomorrow",
                fontSize: 25.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => Gallery()),
                  (Route<dynamic> route) => false);
            },
          ),
          new Divider(
            color: Colors.transparent,
            height: 25.0,
          ),
          new ListTile(
            title: Text(
              'Brands',
              style: TextStyle(fontFamily: "Tomorrow", fontSize: 25.0),
            ),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => Brands()),
                  (Route<dynamic> route) => false);
            },
          ),
          new Divider(
            color: Colors.transparent,
            height: 25.0,
          ),
          new ListTile(
            title: Text(
              'Profile',
              style: TextStyle(fontFamily: "Tomorrow", fontSize: 25.0),
            ),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => MainProfile()),
                  (Route<dynamic> route) => false);
            },
          ),
          new Divider(
            color: Colors.transparent,
            height: 25.0,
          ),
          new ListTile(
            title: Text(
              'Map',
              style: TextStyle(fontFamily: "Tomorrow", fontSize: 25.0),
            ),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => GoogleCustomMap()),
                  (Route<dynamic> route) => false);
            },
          ),
          new Divider(
            color: Colors.transparent,
            height: 25.0,
          ),
          new ListTile(
            title: Text(
              'Feedback',
              style: TextStyle(fontFamily: "Tomorrow", fontSize: 25.0),
            ),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => FeedBack()),
                  (Route<dynamic> route) => false);
            },
          ),
          new Divider(
            color: Colors.transparent,
            height: 25.0,
          ),
          new ListTile(
            title: Text(
              'Logout',
              style: TextStyle(fontFamily: "Tomorrow", fontSize: 25.0),
            ),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => SigninPage()),
                  (Route<dynamic> route) => false);
            },
          ),
          new Divider(
            color: Colors.transparent,
            height: 25.0,
          ),
        ],
      ),
    );
  }
}
