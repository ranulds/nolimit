import 'package:flutter/material.dart';
import 'package:nolimit/gallery/gallery.dart';
import 'package:nolimit/gallery/item.dart';
import 'package:nolimit/map/map.dart';
import 'package:nolimit/shane/notifications.dart';
import 'package:nolimit/wishlist/wishlist.dart';

class GentsCategory extends StatefulWidget {
  @override
  _LadiesCategoryState createState() => _LadiesCategoryState();
}

class _LadiesCategoryState extends State<GentsCategory> {
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
        title: Text('Formal Shirts',
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
            // Padding(
            //   padding: const EdgeInsets.only(left: 20.0),
            //   child: Text(
            //     '8 items found',
            //     style: TextStyle(
            //       fontSize: 15,
            //       color: Colors.grey,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 5,
            // ),
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
                    source: 'images/pexels-andrea-piacquadio-716411 (1).jpg',
                    title: 'Bamboo Linen Shirt',
                    price: 'Rs 1890.00',
                  ),
                  Imagewidget(
                    source: 'images/pexels-andrea-piacquadio-941693 (1).jpg',
                    title: 'Deedat Casual Shirt',
                    price: 'Rs 1550.00',
                  ),
                  Imagewidget(
                    source: 'images/pexels-chloe-kala-1043474 (1).jpg',
                    title: 'Comfy Linen Shirt',
                    price: 'Rs 890.00',
                  ),
                  Imagewidget(
                    source: 'images/pexels-emre-keshavarz-3526923 (1).jpg',
                    title: 'Jack & Smith Casual Shirt',
                    price: 'Rs 1690.00',
                  ),
                  Imagewidget(
                    source: 'images/pexels-martin-péchy-594610 (1).jpg',
                    title: 'MBRK Linen Shirt',
                    price: 'Rs 1790.00',
                  ),
                  Imagewidget(
                    source: 'images/pexels-raul-reynoso-1018911 (1).jpg',
                    title: 'PORTOFINO Casual Shirt',
                    price: 'Rs 1290.00',
                  ),
                  Imagewidget(
                    source: 'images/pexels-sindre-strøm-1040945 (1).jpg',
                    title: 'PORTOFINO Casual Shirt',
                    price: 'Rs 1890.00',
                  ),
                  Imagewidget(
                    source: 'images/pexels-spencer-selover-775358 (1).jpg',
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
