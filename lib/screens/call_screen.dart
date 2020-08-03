import 'package:flutter/material.dart';
import '../calls_and_msgs_service.dart';
import '../main.dart';
import '../widgets/image_picker.dart';
import 'dart:io';
import 'package:location/location.dart';
import '../widgets/user_location.dart';
class CallScreen extends StatefulWidget {

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  List<String> districts = [
    'North and middle Andaman',
    'South Andaman',
    'Nicobar'
  ];
  List<String> nmaAreas = ["Diglipur", "Mayabunder", "Rangat"];
  List<String> nAreas = [
    "Car Nicobar",
    "Nan Cowry",
    "Komotra",
    "Teressa-Chowra",
    "Katchal",
    "Campbelly Bay",
    "Little Nicobar"
  ];
  List<String> sAreas = ["Port Blair", "Ferrar Gung", "Little Andaman"];
  String selectedDis = "North and middle Andaman";
  String selectedarea1 = "Diglipur";
  String selectedarea3 = "Car Nicobar";
  String selectedarea2 = "Port Blair";
  void makeCall(){
    if(selectedDis=="North and middle Andaman"){
      if(selectedarea1=="Diglipur"){
        calls("9550157444");
      }else if(selectedarea1=="Mayabunder"){
        calls("9550157444");
      }else{
        calls("9550157444");
      }
    }else if(selectedDis=="South Andaman"){
      if(selectedarea2=="Port Blair"){
        calls("9550157444");
      }else if(selectedarea2=="Ferrar Gung"){
        calls("9550157444");
      }else{
        calls("9550157444");
      }
    }else{
      if(selectedarea2=="Car Nicobar"){
        calls("9550157444");
      }else if(selectedarea2=="Nan Cowry"){
        calls("9550157444");
      }else if(selectedarea2=="Komotra"){
        calls("9550157444");
      }else if(selectedarea2=="Teressa-Chowra"){
        calls("9550157444");
      }else if(selectedarea2=="Katchal"){
        calls("9550157444");
      }else if(selectedarea2=="Campbelly Bay"){
        calls("9550157444");
      }else{
        calls("9550157444");
      }
    }
  }
  void calls(String num){
    num="+91"+num;
    _service.call(num);
  }
  var _init=true;
  double lat=17.7074834;
  double long=83.3112924;
  File _image;
  @override
  void didChangeDependencies() async{
    if(_init==true){
      final locationData = await Location().getLocation();
     
    setState(() {
      lat = (locationData.latitude);
     long = (locationData.longitude);
    });
    }
    _init=false;
    super.didChangeDependencies();
  }
  void _setImage(File image){
    _image=image;
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              padding: EdgeInsets.all(10),
              child: Text(
                "Are you seeing any kind of wildlife offence or a suffering specie? Call your nearby official immediately.",
                style: TextStyle(
                    fontFamily: "SourceCodePro",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.green, Colors.green[800]],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Select District:",
              style: TextStyle(
                  fontFamily: "SourceCodePro",
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
                iconEnabledColor: Colors.green,
                elevation: 3,
                items: districts.map((String val) {
                  return new DropdownMenuItem<String>(
                    value: val,
                    child: new Text(val),
                  );
                }).toList(),
                value: selectedDis,
                onChanged: (newVal) {
                  this.setState(() {
                    selectedDis = newVal;
                  });
                }),
            Text(
              "Select Area:",
              style: TextStyle(
                  fontFamily: "SourceCodePro",
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            SizedBox(height: 10),
            if (selectedDis == "North and middle Andaman")
              DropdownButton<String>(
                iconEnabledColor: Colors.green,
                elevation: 3,
                items:
                    /*selectedDis == "North and middle Andaman"
                      ? nmaAreas
                      : (selectedDis == "South Andaman" ? sAreas : nAreas)*/
                    nmaAreas.map((String val) {
                  return new DropdownMenuItem<String>(
                    value: val,
                    child: new Text(val),
                  );
                }).toList(),
                value: selectedarea1,
                onChanged: (newVal) {
                  selectedarea1 = newVal;
                  this.setState(() {});
                },
              ),
            if (selectedDis == "South Andaman")
              DropdownButton<String>(
                iconEnabledColor: Colors.green,
                elevation: 3,
                items:
                    /*selectedDis == "North and middle Andaman"
                        ? nmaAreas
                        : (selectedDis == "South Andaman" ? sAreas : nAreas)*/
                    sAreas.map((String val) {
                  return new DropdownMenuItem<String>(
                    value: val,
                    child: new Text(val),
                  );
                }).toList(),
                value: selectedarea2,
                onChanged: (newVal) {
                  selectedarea2 = newVal;
                  this.setState(() {});
                },
              ),
            if (selectedDis == "Nicobar")
              DropdownButton<String>(
                iconEnabledColor: Colors.green,
                elevation: 3,
                items:
                    /*selectedDis == "North and middle Andaman"
                          ? nmaAreas
                          : (selectedDis == "South Andaman" ? sAreas : nAreas)*/
                    nAreas.map((String val) {
                  return new DropdownMenuItem<String>(
                    value: val,
                    child: new Text(val),
                  );
                }).toList(),
                value: selectedarea3,
                onChanged: (newVal) {
                  selectedarea3 = newVal;
                  this.setState(() {});
                },
              ),
            SizedBox(
              height: 20,
            ),
            RaisedButton.icon(
              color: Colors.green,
              onPressed: () {},
              icon: Icon(Icons.call),
              label: Text(
                "Call",
                style: TextStyle(
                    fontFamily: "SourceCodePro",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              padding: EdgeInsets.all(10),
              child: Text(
                "Or Upload an image and location to the officer",
                style: TextStyle(
                    fontFamily: "SourceCodePro",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.indigo[300], Colors.indigo],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width*0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(border:Border.all(color:Colors.black,width:2),),
              child: ImageGetter(_setImage,true),
            ),
            SizedBox(height: 20,),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width*0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(border:Border.all(color:Colors.black,width:2),),
              child: UserLocation(lat,long),
            ),
            SizedBox(height: 20,),
            RaisedButton(onPressed: (){
              print(lat);
            } , child:Text("Report"),),
          ],
        ),
      ),
    );
  }
}
