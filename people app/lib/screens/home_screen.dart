
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
         
              /*Container(
                child: FutureBuilder(
                  future: FirebaseAuth.instance.currentUser(),
                  builder:(ctx,snap){
                    if(snap.connectionState==ConnectionState.waiting){
                      return CircularProgressIndicator();
                    }
                    return StreamBuilder(stream: Firestore.instance
                        .collection('users')
                        .where('uid', isEqualTo: snap.data.uid)
                        .snapshots(),
                      builder: (ctx,snp){
                        return Container(child: Text(snp.data.documents[0]['name'],));
                      } );
                  }   ,
                ),
              ),*/
              Container(
                padding: EdgeInsets.all(10),
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text("Sign Out"),
                ),
              ),
            
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(size.width * 0.05),
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: <Widget>[
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    borderOnForeground: true,
                    elevation: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/dugong.jpeg"),
                        ),
                        const ListTile(
                          title: Text(
                            'Dugong',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          subtitle: Text(
                            "Yesterday , at midnight around 12 30 am, dugong poachers where identified and arrested by andaman police.",
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
