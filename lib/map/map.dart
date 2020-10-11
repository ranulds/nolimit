import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nolimit/shane/notifications.dart';
import 'package:nolimit/util/drawer.dart';
import 'package:permission_handler/permission_handler.dart';

class GoogleCustomMap extends StatefulWidget {
  @override
  _RanulMapState createState() => _RanulMapState();
}

class _RanulMapState extends State<GoogleCustomMap> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(6.9271, 79.8612);

  Future<void> requestPermission() async {
    await Permission.location.request();
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  List<Marker> _markers = <Marker>[];

  @override
  Widget build(BuildContext context) {
    _markers.addAll([
      Marker(
          markerId: MarkerId('1'),
          position: LatLng(6.678683, 80.403818),
          infoWindow:
              InfoWindow(title: 'NOLIMIT Ratnapura', snippet: 'A4, Ratnapura')),
      Marker(
          markerId: MarkerId('2'),
          position: LatLng(6.726237, 79.906727),
          infoWindow: InfoWindow(
              title: 'NOLIMIT Panadura', snippet: '266 Galle Rd, Panadura')),
      Marker(
          markerId: MarkerId('3'),
          position: LatLng(7.249331, 80.342629),
          infoWindow: InfoWindow(title: 'NOLIMIT Kegalle', snippet: 'Kegalle')),
      Marker(
          markerId: MarkerId('4'),
          position: LatLng(6.849051, 79.924357),
          infoWindow: InfoWindow(
              title: 'NOLIMIT Maharagama',
              snippet: '108A High Level Rd, Maharagama')),
      Marker(
          markerId: MarkerId('5'),
          position: LatLng(6.827253, 79.869264),
          infoWindow: InfoWindow(
              title: 'NOLIMIT Mount Lavinia',
              snippet: 'Galle Rd, Mount Lavinia')),
      Marker(
          markerId: MarkerId('6'),
          position: LatLng(6.850000, 79.874726),
          infoWindow:
              InfoWindow(title: 'Y Pay More', snippet: '213 B94, Dehiwala')),
      Marker(
          markerId: MarkerId('7'),
          position: LatLng(6.861372, 79.904999),
          infoWindow: InfoWindow(
              title: 'NOLIMIT Nugegoda',
              snippet: '152 High Level Rd, Nugegoda')),
      Marker(
          markerId: MarkerId('8'),
          position: LatLng(6.847510, 79.866792),
          infoWindow:
              InfoWindow(title: 'NOLIMIT Warehouse', snippet: 'Dehiwala')),
      Marker(
          markerId: MarkerId('9'),
          position: LatLng(6.847618, 79.867994),
          infoWindow: InfoWindow(
              title: 'Nolimit 26 - Discount Store',
              snippet: 'Kawdana Rd, Dehiwala')),
      Marker(
          markerId: MarkerId('10'),
          position: LatLng(6.851371, 79.866737),
          infoWindow: InfoWindow(
              title: 'NOLIMIT Dehiwala', snippet: '17 Hill St, Dehiwala')),
      Marker(
          markerId: MarkerId('11'),
          position: LatLng(6.869548, 79.888201),
          infoWindow: InfoWindow(
              title: 'NOLIMIT Nugegoda', snippet: '99 b120, Nugegoda')),
      Marker(
          markerId: MarkerId('12'),
          position: LatLng(6.914036, 79.877326),
          infoWindow: InfoWindow(
              title: 'NOLIMIT', snippet: '40 D.S.Senanayake Mawatha, Colombo')),
      Marker(
          markerId: MarkerId('13'),
          position: LatLng(6.866906, 79.893464),
          infoWindow: InfoWindow(
              title: 'GLITZ',
              snippet: '267 High level Road, 7th Mile Post, Nugegoda')),
      Marker(
          markerId: MarkerId('14'),
          position: LatLng(6.986469, 79.889135),
          infoWindow: InfoWindow(
              title: 'NOLIMIT Wattala', snippet: '331 Negombo Rd, Wattala')),
      Marker(
          markerId: MarkerId('15'),
          position: LatLng(7.060118, 79.895947),
          infoWindow: InfoWindow(
              title: 'Pop-Up Store by Nolimit', snippet: 'K Zone, Ja-Ela')),
      Marker(
          markerId: MarkerId('16'),
          position: LatLng(7.213289, 79.845414),
          infoWindow: InfoWindow(
              title: 'NOLIMIT Negombo', snippet: '456 Main St, Negombo')),
      Marker(
          markerId: MarkerId('17'),
          position: LatLng(7.282411, 80.623031),
          infoWindow: InfoWindow(
              title: 'NOLIMIT Kandy', snippet: '557 Peradeniya Rd, Kandy')),
    ]);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        primary: false,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Map',
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
      primary: false,
      extendBodyBehindAppBar: false,
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapToolbarEnabled: true,
            compassEnabled: true,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            mapType: _currentMapType,
            rotateGesturesEnabled: true,
            markers: Set<Marker>.of(_markers),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(160.0),
          //   child: Align(
          //     alignment: Alignment.topRight,
          //     child: FloatingActionButton(
          //       onPressed: _onMapTypeButtonPressed,
          //       materialTapTargetSize: MaterialTapTargetSize.padded,
          //       backgroundColor: Colors.green,
          //       child: const Icon(
          //         Icons.map,
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 52),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                constraints: BoxConstraints(maxHeight: 38, maxWidth: 38),
                child: Opacity(
                  opacity: 0.6,
                  child: RaisedButton(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    onPressed: _onMapTypeButtonPressed,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    child: Icon(
                      Icons.map,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
