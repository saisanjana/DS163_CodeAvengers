import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:protecto/helper/db_helper.dart';
import 'package:protecto/screens/nav_screen.dart';
import 'package:protecto/widgets/image_picker.dart';

class OfflineScreen extends StatefulWidget {
  static const routeName = '/offline-screen';
  @override
  _OfflineScreenState createState() => _OfflineScreenState();
}

class _OfflineScreenState extends State<OfflineScreen> {
  File _image;
  double _lat;
  double _long;
  var locTaken = false;
  var _isLoading = false;
  var subscription;
  @override
  void initState() {
    checkConectivity();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      checkConectivity();
    });
    super.initState();
  }

  @override
  dispose() {
    super.dispose();

    subscription.cancel();
  }

  void checkConectivity() async {
    final res = await Connectivity().checkConnectivity();
    if (res == ConnectivityResult.mobile || res == ConnectivityResult.wifi) {
      Navigator.of(context).popAndPushNamed(NavScreen.routeName);
    }
  }

  void _setImage(File image) {
    _image = image;
  }

  void _insertData(BuildContext ctx) async {
    if (_image == null) {
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text('Image not taken'),
      ));
    }
    if (_lat == null || _long == null) {
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text('Location not set'),
      ));
    }
    await DBHelper.insert(DateTime.now().toString(), _image.path, _lat, _long);
    setState(() {
      _isLoading = true;
    });
    //   await DBHelper.insert(DateTime.now().toString(), 'xys', 1.111, 1.111);
    setState(() {
      _image = null;
      _lat = null;
      _long = null;
      locTaken = false;
      _isLoading = false;
    });
  }

  void _setLocation() async {
    final locationData = await Location().getLocation();

    setState(() {
      _lat = (locationData.latitude);
      _long = (locationData.longitude);
      locTaken = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo.png",
                    height: size.height * 0.2,
                  ),
                  ImageGetter(_setImage, false),
                  if (!locTaken)
                    RaisedButton(
                      onPressed: _setLocation,
                      child: Text('Set Location'),
                    ),
                  if (locTaken) Icon(FontAwesomeIcons.check),
                  RaisedButton(
                    onPressed: () => _insertData(context),
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
    );
  }
}
