import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nolimit/gallery/gallery.dart';
import 'package:nolimit/profile/main-profile.dart';
import 'package:nolimit/wishlist/wishlist.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  DateTime selectedDate = DateTime.now();
  int _selectedIndex = 2;
  final _emailtext = TextEditingController(text: 'miranda@gmail.com');
  final _nametext = TextEditingController(text: 'Miranda Lopez');
  final _numberText = TextEditingController();
  bool _validate = true;
  bool _nameValidate = true;
  bool _numberValidate = true;

  @override
  void dispose() {
    _emailtext.dispose();
    _nametext.dispose();
    _numberText.dispose();
    super.dispose();
  }

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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1980, 8),
        lastDate: DateTime(2021));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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
          title: Text('My Account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
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
        body: Container(
            margin: EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Full Name *', 
                  errorText: (_nameValidate == false) ? 'Name can\'t be empty ': null),
                  textAlign: TextAlign.left,
                  controller: _nametext,
                  
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: _emailtext,
                      decoration: InputDecoration(
                          labelText: 'Email *',
                          errorText:
                              (_validate == false) ? 'email can\'t Be empty' : null),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: _numberText,
                      decoration: InputDecoration(
                        labelText: 'Mobile Number *',
                        errorText: (_numberValidate == false) ?'Mobile Number can\'t be empty': null),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Arapaima Card Number'),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'NIC'),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Birth Date ',
                          suffixIcon: Icon(Icons.calendar_today)),
                      onTap: () {
                        // Below line stops keyboard from appearing
                        FocusScope.of(context).requestFocus(new FocusNode());
                        // Show Date Picker Here
                        _selectDate(context);
                      },
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: RaisedButton(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _emailtext.text.isEmpty
                            ? _validate = false
                            : _validate = true;
                        _nametext.text.isEmpty
                            ? _nameValidate = false
                            : _nameValidate = true;
                        _numberText.text.isEmpty
                            ? _numberValidate = false
                            :_numberValidate = true;        
                      });

                      if(_validate && _nameValidate && _numberValidate)
                        Navigator.of(context).pop();
                    },
                    color: Colors.black87,
                    padding:
                        EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                )
              ],
            )));
  }
}
