import 'package:flutter/material.dart';
import 'package:nolimit/gallery/gallery.dart';
import 'package:nolimit/gallery/gents_category.dart';
import 'package:nolimit/gallery/item.dart';
import 'package:nolimit/gallery/jewellary.dart';
import 'package:nolimit/gallery/shoes.dart';
import 'package:nolimit/gallery/watches_categories.dart';
import 'package:nolimit/map/map.dart';
import 'package:nolimit/profile/main-profile.dart';
import 'package:nolimit/shane/notifications.dart';
import 'package:nolimit/wishlist/wishlist.dart';

class AccessoriesSubCategory extends StatefulWidget {
  @override
  _LadiesCategoryState createState() => _LadiesCategoryState();
}

class _LadiesCategoryState extends State<AccessoriesSubCategory> {
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
        title: Text('Accessories',
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
                      'images/pexels-pixabay-277390 (1).jpg',
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
                        'Watches',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FlatButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => WatchCategory())),
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
                        source: 'images/pexels-jatin-anand-125779 (1).jpg',
                        title: 'Watch',
                        price: 'Rs 1890.00',
                      ),
                      Imagewidget(
                        source: 'images/pexels-joey-nguyễn-2113994 (1).jpg',
                        title: 'Watch',
                        price: 'Rs 1550.00',
                      ),
                      Imagewidget(
                        source: 'images/pexels-pixabay-277390 (1).jpg',
                        title: 'Watch',
                        price: 'Rs 890.00',
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
                        'Jewellery',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FlatButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => JewellaryCategory())),
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
                            'images/pexels-anastasiya-lobanovskaya-1035683 (1).jpg',
                        title: 'Necklace',
                        price: 'Rs 1690.00',
                      ),
                      Imagewidget(
                        source: 'images/pexels-valeria-boltneva-965981 (1).jpg',
                        title: 'Necklace',
                        price: 'Rs 690.00',
                      ),
                      Imagewidget(
                        source: 'images/pexels-engin-akyurt-1458867 (1).jpg',
                        title: 'Nike',
                        price: 'Rs 3190.00',
                      ),
                      Imagewidget(
                        source: 'images/pexels-marta-branco-1395306 (1).jpg',
                        title: 'Nike',
                        price: 'Rs 2150.00',
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
                          color: liked ? Colors.red : Colors.grey),
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
