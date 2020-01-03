import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  LatLng _initialPosition =LatLng(46.742584, -14.616818);
  GoogleMapController _controller;
  Location _location = Location();

void _onMapCreated(GoogleMapController _cntrl) {
  _controller =_cntrl;
  _location.onLocationChanged().listen((l){
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(l.latitude,l.longitude),zoom: 15),
      ),
      );
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition:
            CameraPosition(target: _initialPosition, zoom: 200),
            mapType: MapType.terrain,
              onMapCreated : _onMapCreated,
            myLocationButtonEnabled: true,
          )
        ],
      ),
    );
  }
}
