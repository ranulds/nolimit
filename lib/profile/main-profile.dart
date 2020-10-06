import 'package:flutter/material.dart';
import 'package:nolimit/profile/my-account.dart';
import 'package:nolimit/profile/change-password.dart';
import 'package:nolimit/profile/mobile-verification.dart';


class MainProfile extends StatefulWidget {
  @override
  _MainProfileState createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  Widget _buildCards(String title, Icon icon, Object navPage) {
    return Card(
      child: ListTile(
        leading: icon,
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => navPage))
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: 100.0,
        child: ListView(
          children: <Widget>[
            Image.asset('images/profile/propic.png', fit: BoxFit.fill,),
            _buildCards('My Account', Icon(Icons.people_outline,), new MyAccount()),
            _buildCards('Change Password', Icon(Icons.vpn_key), new ChangePassword()),
            _buildCards('Mobile Verification', Icon(Icons.mobile_screen_share), new MobileVerification()),
            _buildCards('Notifications', Icon(Icons.notifications), new MyAccount()),
            _buildCards('Logout', Icon(Icons.notifications), MyAccount()),
          ],
        ),
      ),
    );
  }
}
