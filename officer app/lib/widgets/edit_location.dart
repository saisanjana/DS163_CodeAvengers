import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:protecto/helper/db_helper.dart';

class EditLocation extends StatefulWidget {
  final Function setLoc;
  double lat;
  double long;

  EditLocation(this.lat, this.long,this.setLoc);
  @override
  _EditLocationState createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {
  LatLng toSend = LatLng(17.7074834, 83.3112924);


  void _changeLoc(Map<String,dynamic> mp){
      DBHelper.update(mp);
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
          body: Column(
            children: <Widget>[
              Container(
              height: size.height * 0.6,
              width: size.width,
              child: FlutterMap(
                options: MapOptions(
                  onTap: (user) {
                    setState(() {
                      widget.lat = user.latitude;
                      widget.long = user.longitude;
                    });
                  },
                  center: LatLng(widget.lat, widget.long),
                  zoom: 13.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(widget.lat, widget.long),
                        builder: (ctx) => Container(
                            child: Icon(
                          Icons.location_on,
                          color: Colors.red,
                        )),
                      ),
                    ],
                  )
                ],
              )),
              FlatButton(onPressed: null, child: Text('Change Location'))
            ],
          ),
    );
  }
}
