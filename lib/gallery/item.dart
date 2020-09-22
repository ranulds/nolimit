import 'package:floating_pullup_card/floating_layout.dart';
import 'package:floating_pullup_card/floating_pullup_card.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';

class Item extends StatefulWidget {
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
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
        backgroundColor: Colors.transparent,
        title: Text('',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
      ),
      primary: false,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: FloatingPullUpCardLayout(
        cardColor: Colors.white70,
        onOutsideTap: () => FloatingPullUpState.collapsed,
        uncollpsedStateOffset: (_) => MediaQuery.of(context).size.height * 0.75,
        height: MediaQuery.of(context).size.height * 0.25,
        child: PinchZoomImage(
          image: Image.asset(
            'images/placeimg_640_480_people (1).jpg',
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              'Lace Midi Skirt',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Rs 1890',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Soft Pink',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
