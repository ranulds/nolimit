import 'package:flutter/material.dart';
import 'package:nolimit/gallery/ladies_sub_categories.dart';
import 'package:nolimit/map/map.dart';
import 'package:nolimit/signup/signin.dart';
import 'package:nolimit/signup/signup.dart';
import 'package:nolimit/wishlist/wishlist.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              accountName: Text(
                ' Hello!! Andrew Peries',
                style: TextStyle(fontSize: 20.0),
              ),
              accountEmail: Text('andrewperies@nolimit.lk'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/female_woman_avatar_portrait_1-512.png'),
              ),
            ),
            new ListTile(
              title: Text(
                'Home',
                style: TextStyle(fontFamily: "Tomorrow", fontSize: 25.0),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            new Divider(
              color: Colors.black,
              height: 25.0,
            ),
            new ListTile(
              title: Text(
                'Gallery',
                style: TextStyle(fontFamily: "Tomorrow", fontSize: 25.0),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            new Divider(
              color: Colors.black,
              height: 25.0,
            ),
            new ListTile(
              title: Text(
                'Brands',
                style: TextStyle(fontFamily: "Tomorrow", fontSize: 25.0),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            new Divider(
              color: Colors.black,
              height: 25.0,
            ),
            new ListTile(
              title: Text(
                'Profile',
                style: TextStyle(fontFamily: "Tomorrow", fontSize: 25.0),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            new Divider(
              color: Colors.black,
              height: 25.0,
            ),
            new ListTile(
              title: Text(
                'Map',
                style: TextStyle(fontFamily: "Tomorrow", fontSize: 25.0),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            new Divider(
              color: Colors.black,
              height: 25.0,
            ),
            new ListTile(
              title: Text(
                'Feedback',
                style: TextStyle(fontFamily: "Tomorrow", fontSize: 25.0),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            new Divider(
              color: Colors.black,
              height: 25.0,
            ),
            new ListTile(
              title: Text(
                'Logout',
                style: TextStyle(fontFamily: "Tomorrow", fontSize: 25.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SigninPage(),
                  ),
                );
              },
            ),
            new Divider(
              color: Colors.black,
              height: 25.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      primary: false,
      appBar: AppBar(
        primary: false,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('', style: TextStyle(color: Colors.black)),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => LadiesSubCategory())),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Stack(
                        children: [
                          Image.asset(
                            'images/placeimg_640_480_people (1).jpg',
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Ladies',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(20),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => SignupPage())),
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset(
                        'images/placeimg_640_480_people (1).jpg',
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(20),
                    ),
                  ),
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      'images/placeimg_640_480_people (1).jpg',
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(20),
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
