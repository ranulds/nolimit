import 'package:flutter/material.dart';
import 'package:nolimit/gallery/gallery.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        primary: false,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                '8 items found',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                WishListItem(),
                WishListItem(),
                WishListItem(),
                WishListItem(),
                WishListItem(),
                WishListItem(),
                WishListItem(),
                WishListItem(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class WishListItem extends StatefulWidget {
  const WishListItem({Key key}) : super(key: key);

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
        : Column(
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
                              'images/placeimg_640_480_people (1).jpg',
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
                          'Lace  Midi Skirt',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Rs 1750'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Soft Pink')
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(liked ? Icons.favorite : Icons.favorite_border,
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
          );
  }
}
