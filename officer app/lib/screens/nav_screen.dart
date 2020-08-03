import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:protecto/helper/db_helper.dart';

import 'package:protecto/screens/add_report.dart';
import 'package:protecto/screens/discussions_screen.dart';

import 'package:protecto/screens/offline_screen.dart';
import 'package:protecto/screens/reports_pending.dart';
import 'package:protecto/screens/reports_screen.dart';
import 'package:protecto/screens/stats.dart';

class NavScreen extends StatefulWidget {
  static const routeName = '/nav-screen';
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _email;
  var _phone;
  var _username;
  final List<Widget> _screens = [
    ReportsScreen(),
    AddReportScreen(),
    DiscussionsScreen(),
    BucketingAxisScatterPlotChart.withSampleData(),
  ];
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

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();

    subscription.cancel();
  }

  void checkConectivity() async {
    final res = await Connectivity().checkConnectivity();
    if (res == ConnectivityResult.none) {
      Navigator.of(context).popAndPushNamed(OfflineScreen.routeName);
    } else {
      final data = await DBHelper.getData();
      print(data);
      if (data.length > 0) {
       Navigator.of(context).popAndPushNamed(ReportsPending.routeName,arguments: data);
        //upload the data to database
      }
    }
  }

  void _setDetails(String id) async {
    var valid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (valid) {
      _formKey.currentState.save();

      await Firestore.instance
          .collection('officers')
          .document(id)
          .setData({'username': _username, 'phone': _phone, 'email': _email});
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        body: FutureBuilder(
          future: FirebaseAuth.instance.currentUser(),
          builder: (ctx, snap) {
            if (snap.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            return FutureBuilder(
                future: Firestore.instance
                    .collection('officers')
                    .document(snap.data.uid)
                    .get(),
                builder: (ctx, snaps) {
                  if (snaps.connectionState == ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator());

                  if (!snaps.data.exists) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Please Submit your details to continue to app',style: TextStyle(),),
                        Center(
                          child: Form(
                            key: _formKey,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  TextFormField(
                                    key: ValueKey('email'),
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.mail,
                                      ),
                                      hintText: "Email",
                                      border: InputBorder.none,
                                    ),
                                    validator: (val) {
                                      if (val.length < 3)
                                        return "Enter valid Email";
                                      return null;
                                    },
                                    onSaved: (val) => _email = val,
                                  ),
                                  TextFormField(
                                    key: ValueKey('phone'),
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.call,
                                      ),
                                      hintText: "phone",
                                      border: InputBorder.none,
                                    ),
                                    validator: (val) {
                                      if (val.length < 10 || val.length > 10)
                                        return "Enter valid phone number";
                                      return null;
                                    },
                                    onSaved: (val) => _phone = val,
                                  ),
                                  TextFormField(
                                    key: ValueKey('username'),
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.person,
                                      ),
                                      hintText: "Name",
                                      border: InputBorder.none,
                                    ),
                                    validator: (val) {
                                      if (val.length < 5)
                                        return "Enter valid username";
                                      return null;
                                    },
                                    onSaved: (val) => _username = val,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        FlatButton(
                            onPressed: () => _setDetails(snap.data.uid),
                            child: Text('Submit'))
                      ],
                    );
                  } else
                    return TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: _screens);
                });
          },
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(FontAwesomeIcons.home, size: size.height * 0.04),
            ),
            Tab(
                icon: Image.asset('assets/images/report_logo.png',
                    height: size.height * 0.04)),
            Tab(
              icon: Icon(
                FontAwesomeIcons.users,
                size: size.height * 0.04,
              ),
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.chartBar, size: size.height * 0.04),
            )
          ],
          unselectedLabelColor: Color.fromRGBO(0, 0, 139, 1),
          labelColor: Colors.green,
          indicatorColor: Colors.black,
        ),
      ),
    );
  }
}
