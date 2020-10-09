import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:nolimit/gallery/gallery.dart';
import 'package:nolimit/profile/main-profile.dart';
import 'package:nolimit/shane/notifications.dart';
import 'package:nolimit/util/drawer.dart';
import 'package:nolimit/wishlist/wishlist.dart';

class CarouselPage extends StatefulWidget {
  @override
  _carouselPage createState() => _carouselPage();
}

class _carouselPage extends State<CarouselPage> {
  int _selectedIndex = 1;

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
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        primary: false,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text('', style: TextStyle(color: Colors.black)),
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
      body: ImageCarousel(),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  Widget build(BuildContext context) {
    return Carousel(
      boxFit: BoxFit.cover,
      dotColor: Colors.transparent,
      images: [
        AssetImage('assets/1.jpg'),
        AssetImage('assets/2.jpg'),
        AssetImage('assets/3.jpg'),
        AssetImage('assets/4.jpg'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 2000),
    );
  }
}
