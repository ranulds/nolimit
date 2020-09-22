import 'package:flutter/material.dart';
import 'package:nolimit/gallery/gallery.dart';
import 'package:nolimit/gallery/ladies_category.dart';
import 'package:nolimit/map/map.dart';
import 'package:nolimit/wishlist/wishlist.dart';

class LadiesSubCategory extends StatefulWidget {
  @override
  _LadiesCategoryState createState() => _LadiesCategoryState();
}

class _LadiesCategoryState extends State<LadiesSubCategory> {
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
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => RanulMap()));
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
        selectedItemColor: Colors.black,
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
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('Ladies',
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
            onPressed: () {},
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
                      'images/placeimg_640_480_people (1).jpg',
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
                        'Formal Skirts',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FlatButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => LadiesCategory())),
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
                        source: 'images/placeimg_640_480_people (1).jpg',
                      ),
                      Imagewidget(
                        source: 'images/placeimg_640_480_people (1).jpg',
                      ),
                      Imagewidget(
                        source: 'images/placeimg_640_480_people (1).jpg',
                      ),
                      Imagewidget(
                        source: 'images/placeimg_640_480_people (1).jpg',
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
                        'Handbags',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FlatButton(
                        onPressed: () => {},
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
                        source: 'images/placeimg_640_480_people (1).jpg',
                      ),
                      Imagewidget(
                        source: 'images/placeimg_640_480_people (1).jpg',
                      ),
                      Imagewidget(
                        source: 'images/placeimg_640_480_people (1).jpg',
                      ),
                      Imagewidget(
                        source: 'images/placeimg_640_480_people (1).jpg',
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
                        'Blouse',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FlatButton(
                        onPressed: () => {},
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
                        source: 'images/placeimg_640_480_people (1).jpg',
                      ),
                      Imagewidget(
                        source: 'images/placeimg_640_480_people (1).jpg',
                      ),
                      Imagewidget(
                        source: 'images/placeimg_640_480_people (1).jpg',
                      ),
                      Imagewidget(
                        source: 'images/placeimg_640_480_people (1).jpg',
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
  const Imagewidget({Key key, this.source}) : super(key: key);

  final String source;

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
    return Container(
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
            'Lace  Midi Skirt',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Rs 1750',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
