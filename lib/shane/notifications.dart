import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  //   if (index == 0)
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (_) => WishList()),
  //         (Route<dynamic> route) => false);
  //   else if (index == 1)
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (_) => Gallery()),
  //         (Route<dynamic> route) => false);
  //   else if (index == 2)
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (_) => GoogleCustomMap()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   showSelectedLabels: true,
      //   showUnselectedLabels: true,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       title: Text('Wishlist'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_basket),
      //       title: Text('Gallery'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_circle),
      //       title: Text('Profile'),
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.black54,
      //   onTap: _onItemTapped,
      // ),
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
        centerTitle: true,
        title: Text('Notifications', style: TextStyle(color: Colors.black)),
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
        child: ListView(
          children: [
            NotificationItem(
              title: '10% Discount add for Adidas products',
            ),
            NotificationItem(
              title: '10% Discount add for Lacoste products',
            ),
            NotificationItem(
              title: '10% Discount add for Trendy products',
            ),
            NotificationItem(
              title: '10% Discount add for Puma products',
            ),
            NotificationItem(
              title: '20% Discount add for Nike products',
            ),
            NotificationItem(
              title: '10% Discount add for Reebok products',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatefulWidget {
  const NotificationItem({this.title, Key key}) : super(key: key);

  final String title;

  @override
  _NotificationItemState createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  bool remove = false;

  _pressed() {
    setState(() {
      remove = !remove;
    });
  }

  @override
  Widget build(BuildContext context) {
    return remove
        ? Container()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Stack(
              children: [
                Card(
                  // shape: RoundedRectangleBorder(
                  // borderRadius: BorderRadius.circular(20.0)),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 40),
                    child: Center(child: Text(widget.title)),
                  ),
                ),
                Align(
                  child: Material(
                    type: MaterialType.transparency,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.red),
                      onPressed: () => _pressed(),
                    ),
                  ),
                  alignment: Alignment.topRight,
                )
              ],
            ),
          );
  }
}
