import 'package:flutter/material.dart';
import 'package:nolimit/gallery/gallery.dart';
import 'package:nolimit/gallery/item.dart';
import 'package:nolimit/gallery/kids_category.dart';
import 'package:nolimit/profile/main-profile.dart';
import 'package:nolimit/shane/notifications.dart';
import 'package:nolimit/wishlist/wishlist.dart';

class KidsSubCategory extends StatefulWidget {
  @override
  _LadiesCategoryState createState() => _LadiesCategoryState();
}

class _LadiesCategoryState extends State<KidsSubCategory> {
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
        selectedItemColor: Colors.blue[900],
        onTap: _onItemTapped,
      ),
      primary: false,
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
        title: Text('Kids',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
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
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  children: [
                    Image.asset(
                      'images/pexels-tuấn-kiệt-jr-1765423 (1).jpg',
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Spring collection',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Kids Dresses',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FlatButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => KidsCategory())),
                        child: Text('show all'),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Imagewidget(
                        source: 'images/pexels-philip-boakye-2995309 (1).jpg',
                        title: 'Bamboo Linen Shirt',
                        price: 'Rs 1890.00',
                      ),
                      Imagewidget(
                        source:
                            'images/pexels-thiszun-(follow-me-on-ig-fb)-1139613 (1).jpg',
                        title: 'Deedat Casual Shirt',
                        price: 'Rs 1550.00',
                      ),
                      Imagewidget(
                        source:
                            'images/pexels-victoria-borodinova-1094084 (1).jpg',
                        title: 'Comfy Linen Shirt',
                        price: 'Rs 890.00',
                      ),
                      Imagewidget(
                        source:
                            'images/pexels-victoria-borodinova-1619697 (1).jpg',
                        title: 'Jack & Smith Casual Shirt',
                        price: 'Rs 1690.00',
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Kids Dresses',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FlatButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => KidsCategory())),
                        child: Text('show all'),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Imagewidget(
                        source:
                            'images/pexels-victoria-borodinova-1619705 (1).jpg',
                        title: 'MBRK Linen Shirt',
                        price: 'Rs 1790.00',
                      ),
                      Imagewidget(
                        source:
                            'images/pexels-victoria-borodinova-1619772 (1).jpg',
                        title: 'PORTOFINO Casual Shirt',
                        price: 'Rs 1290.00',
                      ),
                      Imagewidget(
                        source:
                            'images/pexels-victoria-borodinova-1620815 (1).jpg',
                        title: 'PORTOFINO Casual Shirt',
                        price: 'Rs 1890.00',
                      ),
                      Imagewidget(
                        source:
                            'images/pexels-victoria-borodinova-1620826 (1).jpg',
                        title: 'Bamboo Linen Shirt',
                        price: 'Rs 1550.00',
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Kids Dresses',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FlatButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => KidsCategory())),
                        child: Text('show all'),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Imagewidget(
                        source:
                            'images/pexels-victoria-borodinova-1650281 (1).jpg',
                        title: 'MBRK Linen Shirt',
                        price: 'Rs 1690.00',
                      ),
                      Imagewidget(
                        source:
                            'images/pexels-victoria-borodinova-1651888 (1).jpg',
                        title: 'PORTOFINO Casual Shirt',
                        price: 'Rs 890.00',
                      ),
                      Imagewidget(
                        source: 'images/pexels-philip-boakye-2995309 (1).jpg',
                        title: 'PORTOFINO Casual Shirt',
                        price: 'Rs 1550.00',
                      ),
                      Imagewidget(
                        source:
                            'images/pexels-thiszun-(follow-me-on-ig-fb)-1139613 (1).jpg',
                        title: 'Bamboo Linen Shirt',
                        price: 'Rs 1890.00',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Imagewidget extends StatefulWidget {
  const Imagewidget({Key key, this.source, this.title, this.price})
      : super(key: key);

  final String source, title, price;

  @override
  _ImagewidgetState createState() => _ImagewidgetState();
}

class _ImagewidgetState extends State<Imagewidget> {
  bool liked = false;

  _pressed() {
    setState(() {
      liked = !liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => Item())),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 160.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      widget.source,
                    ),
                  ),
                ),
                Align(
                  child: Material(
                    type: MaterialType.transparency,
                    child: IconButton(
                      icon: Icon(liked ? Icons.favorite : Icons.favorite_border,
                          color: liked ? Colors.red : Colors.grey[700]),
                      onPressed: () => _pressed(),
                    ),
                  ),
                  alignment: Alignment.topRight,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              widget.price,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
