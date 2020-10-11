import 'package:flutter/material.dart';
import 'package:nolimit/gallery/gallery.dart';
import 'package:nolimit/gallery/item.dart';
import 'package:nolimit/map/map.dart';
import 'package:nolimit/shane/notifications.dart';
import 'package:nolimit/wishlist/wishlist.dart';

class KidsCategory extends StatefulWidget {
  @override
  _LadiesCategoryState createState() => _LadiesCategoryState();
}

class _LadiesCategoryState extends State<KidsCategory> {
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
          .push(MaterialPageRoute(builder: (_) => GoogleCustomMap()));
  }

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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Kids Dresses',
            style: TextStyle(
              color: Colors.black,
            )),
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.7),
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
                    source: 'images/pexels-tuấn-kiệt-jr-1765423 (1).jpg',
                    title: 'Comfy Linen Shirt',
                    price: 'Rs 890.00',
                  ),
                  Imagewidget(
                    source: 'images/pexels-victoria-borodinova-1094084 (1).jpg',
                    title: 'Jack & Smith Casual Shirt',
                    price: 'Rs 1690.00',
                  ),
                  Imagewidget(
                    source: 'images/pexels-victoria-borodinova-1619697 (1).jpg',
                    title: 'MBRK Linen Shirt',
                    price: 'Rs 1790.00',
                  ),
                  Imagewidget(
                    source: 'images/pexels-victoria-borodinova-1619772 (1).jpg',
                    title: 'PORTOFINO Casual Shirt',
                    price: 'Rs 1290.00',
                  ),
                  Imagewidget(
                    source: 'images/pexels-victoria-borodinova-1620815 (1).jpg',
                    title: 'PORTOFINO Casual Shirt',
                    price: 'Rs 1890.00',
                  ),
                  Imagewidget(
                    source: 'images/pexels-victoria-borodinova-1620826 (1).jpg',
                    title: 'Bamboo Linen Shirt',
                    price: 'Rs 1550.00',
                  ),
                ],
              ),
            ),
          ],
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
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Item())),
        child: Container(
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.asset(
                        widget.source,
                      ),
                    ),
                  ),
                  Align(
                    child: Material(
                      type: MaterialType.transparency,
                      child: IconButton(
                        icon: Icon(
                            liked ? Icons.favorite : Icons.favorite_border,
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
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  widget.price,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
