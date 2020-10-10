import 'package:flutter/material.dart';
import 'package:nolimit/gallery/gallery.dart';
import 'package:nolimit/gallery/item.dart';
import 'package:nolimit/profile/main-profile.dart';
import 'package:nolimit/shane/notifications.dart';
import 'package:nolimit/util/drawer.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0)
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => WishList()),
          (Route<dynamic> route) => false);
    else if (index == 1)
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Gallery()),
          (Route<dynamic> route) => false);
    else if (index == 2)
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MainProfile()),
          (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        primary: false,
        // elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Wishlist',
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
          children: [
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
            //   height: 10,
            // ),
            Expanded(
                child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                WishListItem(
                  source: 'images/pexels-andriana-3317434 (1).jpg',
                  title: 'Lace Midi Skirt',
                  price: 'Rs 1890',
                  colour: 'Soft Pink',
                ),
                WishListItem(
                  source: 'images/pexels-daria-shevtsova-1391580 (1).jpg',
                  title: 'Ladies Formal Skirt',
                  price: 'Rs 1290',
                  colour: 'Black',
                ),
                WishListItem(
                  source: 'images/pexels-lucas-queiroz-1852382 (1).jpg',
                  title: 'Ladies Blouse',
                  price: 'Rs 990',
                  colour: 'Orange',
                ),
                WishListItem(
                  source: 'images/pexels-mikotoraw-4132651 (1).jpg',
                  title: 'Over coat',
                  price: 'Rs 3590',
                  colour: 'Dark Grey',
                ),
                WishListItem(
                  source: 'images/pexels-quang-anh-ha-nguyen-884979 (1).jpg',
                  title: 'Skinny Top',
                  price: 'Rs 590',
                  colour: 'Cream White',
                ),
                WishListItem(
                  source: 'images/pexels-spencer-selover-428340 (1).jpg',
                  title: 'Casual T-Shirt',
                  price: 'Rs 1590',
                  colour: 'White',
                ),
                WishListItem(
                  source: 'images/man yellow tshirt.jpg',
                  title: 'Baggy T-Shirt',
                  price: 'Rs 1590',
                  colour: 'Orange',
                ),
                WishListItem(
                  source: 'images/placeimg_640_480_people (1).jpg',
                  title: 'Ladies Formal Skirt',
                  price: 'Rs 1290',
                  colour: 'Black',
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class WishListItem extends StatefulWidget {
  const WishListItem(
      {Key key, this.source, this.title, this.price, this.colour})
      : super(key: key);

  final String source, title, price, colour;

  @override
  _WishListItemState createState() => _WishListItemState();
}

class _WishListItemState extends State<WishListItem> {
  bool remove = false;
  bool liked = true;

  _pressed() {
    setState(() {
      liked = !liked;
      remove = !remove;
    });
  }

  @override
  Widget build(BuildContext context) {
    return remove
        ? Container()
        : GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Item())),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                // fit: BoxFit.contain,
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(widget.price),
                          SizedBox(
                            height: 5,
                          ),
                          Text(widget.colour)
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                            liked ? Icons.favorite : Icons.favorite_border,
                            color: liked ? Colors.red : Colors.grey),
                        color: Colors.red,
                        onPressed: () => _pressed(),
                      ),
                    ],
                  ),
                ),
                Divider(
                  endIndent: 20,
                  indent: 20,
                  height: 40,
                ),
              ],
            ),
          );
  }
}
