import 'package:flutter/material.dart';
import 'package:protecto/helper/db_helper.dart';
import 'package:protecto/screens/nav_screen.dart';
import 'package:protecto/widgets/report_pending_widget.dart';

class ReportsPending extends StatefulWidget {
  static const routeName='/report-pending';
  @override
  _ReportsPendingState createState() => _ReportsPendingState();
}

class _ReportsPendingState extends State<ReportsPending> {
  void _upload(){
    DBHelper.delete();
    Navigator.of(context).popAndPushNamed(NavScreen.routeName);
  }
  void later(){
       DBHelper.delete();
    Navigator.of(context).popAndPushNamed(NavScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _reports =
        ModalRoute.of(context).settings.arguments as dynamic;
        final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 139, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              RaisedButton(onPressed: _upload,child: Text('Submit'),),
              RaisedButton(onPressed: _upload,child: Text('Submit'),),
              Container(
                height: size.height*0.9,
                child: ListView.builder(
                  itemBuilder: (ctx, ind) {
                    return ReportPendingWidget(_reports[ind],ind);
                  },
                  itemCount: _reports.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
