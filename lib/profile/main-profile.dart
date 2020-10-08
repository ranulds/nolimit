import 'package:flutter/material.dart';
import 'package:nolimit/profile/my-account.dart';
import 'package:nolimit/profile/change-password.dart';
import 'package:nolimit/profile/mobile-verification.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MainProfile extends StatefulWidget {
  @override
  _MainProfileState createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  bool val = false;
  File _image;
  final _picker = ImagePicker();
  onSwitchValueChanges(bool newVal) {
    setState(() {
      val = newVal;
    });
  }

  _imgFromCamera() async {
    PickedFile image = await _picker.getImage(
        source: ImageSource.camera);

    setState(() {
      if(image != null){
        _image = File(image.path);
      }else{
        print('No image selected.');
      }
    });
  }

  _imgFromGallery() async {
    PickedFile image = await _picker.getImage(
        source: ImageSource.gallery);

    setState(() {
      if(image != null){
        _image = File(image.path);
      }else{
        print('No image selected.');
      }
    });
  }


  void _showPicker(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
}

  Widget _buildCards(String title, Icon icon, Object navPage) {
    return Card(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: 100.0,
        child: ListView(
          children: <Widget>[
            // Stack(
            //   children: [
            //     Image.asset(
            //       'images/profile/propic.png',
            //       fit: BoxFit.fill,
            //     ),
            //     // _buildCards('My Account', Icon(Icons.people_outline,), new MyAccount()),

            //     Image.asset(
            //       'images/lacoste.jpg',
            //       fit: BoxFit.fill,
            //     ),
            //     _buildCards(
            //         'My Account',
            //         Icon(
            //           Icons.people_outline,
            //         ),
            //         new MyAccount()),
            //   ],
            // ),

            SizedBox(
          height: 32,
        ),
        Center(
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
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50)),
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
            ),
          ),
        ),

            Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: _buildCards('Change Password', Icon(Icons.vpn_key),
                    new ChangePassword())),
            _buildCards('Mobile Verification', Icon(Icons.mobile_screen_share),
                new MobileVerification()),
            _buildCards(
                'Notifications', Icon(Icons.notifications), new MyAccount()),
            _buildCards('Logout', Icon(Icons.notifications), MyAccount()),
            Padding(
              padding: EdgeInsets.only(top: 50, right: 10, left: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
