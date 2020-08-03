import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
class UserLocation extends StatefulWidget {
  double lat;
  double long;
  UserLocation(this.lat,this.long);
  @override
  _UserLocationState createState() => _UserLocationState();
}

class _UserLocationState extends State<UserLocation> {

  
  LatLng toSend=LatLng(17.7074834, 83.3112924);
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      height: size.height*0.4,
      width: size.width,
        child:FlutterMap(
    options:  MapOptions(
      onTap: (user){
        setState(() {
          widget.lat=user.latitude;
          widget.long=user.longitude; 
        });
      },
      center:  LatLng(widget.lat,widget.long),
      zoom: 13.0,
    ),
    layers: [
       TileLayerOptions(
        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a','b','c'],
      ),   
      MarkerLayerOptions(
        markers: [
           Marker(
            width: 80.0,
            height: 80.0,
            point:  LatLng(widget.lat, widget.long),
            builder: (ctx) =>
             Container(
              child:Icon(Icons.location_on,color: Colors.red,)
            ),
          ),
        ],
      )
    ],
        )
    );
  }
}