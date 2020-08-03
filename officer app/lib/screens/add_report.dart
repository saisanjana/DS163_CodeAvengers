import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:protecto/widgets/image_picker.dart';
import 'package:protecto/widgets/user_location.dart';

class AddReportScreen extends StatefulWidget {
  @override
  _AddReportScreenState createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  var _init=true;
  double lat=17.7074834;
  double long=83.3112924;
  File _image;
  String dt;
  @override
  void didChangeDependencies() async{
    if(_init==true){
      final locationData = await Location().getLocation();
     
    setState(() {
      lat = (locationData.latitude);
     long = (locationData.longitude);
     dt=DateTime.now().toString();
    });
    }
    _init=false;
    super.didChangeDependencies();
  }
  void _setImage(File image){
    _image=image;
    print(_image.path);
  }
  void _upLoadReport()async{
    var user = await  FirebaseAuth.instance.currentUser();
    var id=user.uid;
    final ref =   FirebaseStorage.instance.ref().child("report_images").child(_image.toString()+'.jpg');
      await ref.putFile(File(_image.path)).onComplete;
      final url = await ref.getDownloadURL();
      await Firestore.instance.collection("reports").document('$id+$dt').setData({
        "lat":lat,
        "long":long,
        "officer_id":id.toString(),
        "imageurl":url,
       // "area":area,

      });
      setState(() {
        lat=null;
        long=null;
        _image=null;
        dt=null;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          ImageGetter(_setImage,true),
          UserLocation(lat,long),
          RaisedButton(onPressed: _upLoadReport, child: Text('Submit'))
        ]
        
      ),
    );
  }
}