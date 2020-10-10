import 'package:flutter/material.dart';
import 'package:nolimit/gallery/gallery.dart';
import 'package:nolimit/profile/my-account.dart';
import 'package:nolimit/profile/change-password.dart';
import 'package:nolimit/profile/mobile-verification.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nolimit/shane/notifications.dart';
import 'dart:io';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nolimit/signup/signin.dart';
import 'package:nolimit/wishlist/wishlist.dart';

class MainProfile extends StatefulWidget {
  @override
  _MainProfileState createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  int _selectedIndex = 2;
  bool val = false;
  File _image;
  final _picker = ImagePicker();
  onSwitchValueChanges(bool newVal) {
    setState(() {
      val = newVal;
    });
  }

  Widget getSelectContainers(icon) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            //  border: Colors.red,
            borderRadius: BorderRadius.circular(50)),
        width: 100,
        height: 100,
        margin: EdgeInsets.all(10),
        child: Transform.scale(
          scale: 1.5,
          child: Icon(
            icon,
            color: Colors.grey[800],
          ),
        ));
  }

  _imgFromCamera() async {
    PickedFile image = await _picker.getImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  _imgFromGallery() async {
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  _imgDelete() async {
    setState(() {
      _image = null;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                margin: EdgeInsets.all(10),
                child: new Wrap(children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  _imgDelete();
                                  Navigator.of(context).pop();
                                },
                                child:
                                    getSelectContainers(Icons.delete_outline)),
                            Text('Delete',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16))
                          ]),
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  _imgFromGallery();
                                  Navigator.of(context).pop();
                                },
                                child: getSelectContainers(Icons.insert_photo)),
                            Text('Select from Gallery',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16))
                          ]),
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  _imgFromCamera();
                                  Navigator.of(context).pop();
                                },
                                child: getSelectContainers(Icons.camera_alt)),
                            Text('Camera',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16))
                          ]),
                    ],
                  ),
                  Row(children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(20),
                      child: RaisedButton(
                        child: Text(
                          'Cancel',
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
                    ))
                  ])
                ])),
          );
        });
  }

  Widget _buildCards(String title, Icon icon, Object navPage) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 8.0,
      child: ListTile(
          leading: icon,
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => navPage))),
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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5.0,
       // iconSize: 30,
        backgroundColor: Colors.white,//Colors.grey[100],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),//Icon(FlutterIcons.favorite_border_mdi),
            title: Text('Wishlist'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket), //FlutterIcons.bag_sli
            title: Text('Gallery'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), //face_profile_mco//account_circle_mdi//account_circle_outline_mco//FlutterIcons.account_outline_mco
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[900],
        onTap: _onItemTapped,
      ),
      primary: false,
      body: Container(
        //height: 100.0,
        child: ListView(
          children: <Widget>[
            Stack(
              children: [
                Container(
                    height: 250,
                    child: Image.asset(
                      'images/profile/profilepric.jpg',
                      fit: BoxFit.fill,
                    )),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                        child: Padding(
                      padding: EdgeInsets.only(top: 60, bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Color(0xffFDCF09),
                          child: _image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    _image,
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.fitHeight,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(50)),
                                  width: 120,
                                  height: 120,
                                  child: Transform.scale(
                                    scale: 2.0,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.grey[800],
                                    ),
                                  )),
                        ),
                      ),
                    )),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Miranda Lopez",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    bottom: 50,
                    left: 210,
                    child: GestureDetector(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          width: 45,
                          height: 45,
                          margin: EdgeInsets.all(10),
                          child: Transform.scale(
                            scale: 1.0,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                            ),
                          )),
                    )),
               
              ],
            ),
            Container(
              height: 360,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ListView(children: <Widget>[
                _buildCards(
                    'My Account',
                    Icon(
                      FlutterIcons.people_mdi,
                    ),
                    new MyAccount()),
                Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: _buildCards(
                        'Change Password',
                        Icon(FlutterIcons.key_mco), //device_mobile_oct key_mco
                        new ChangePassword())),
                _buildCards('Mobile Verification',
                    Icon(Icons.mobile_screen_share), new MobileVerification()),
                _buildCards('Notifications', Icon(Icons.notifications),
                    new Notifications()),
                _buildCards(
                    'Logout', Icon(FlutterIcons.log_out_ent), SigninPage()),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 20, left: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Enable Notifications ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                    Transform.scale(
                        scale: 1.5,
                        child: Switch(
                            value: val,
                            activeColor: Colors.blue[900], //olors.indigo[400]
                            onChanged: (newVal) {
                              onSwitchValueChanges(newVal);
                            }))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
