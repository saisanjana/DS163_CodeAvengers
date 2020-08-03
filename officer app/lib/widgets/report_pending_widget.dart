import 'package:flutter/material.dart';

class ReportPendingWidget extends StatelessWidget {
  final Map<String, dynamic> report;
  final ind;
  ReportPendingWidget(this.report,this.ind);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        borderOnForeground: true,
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(report['image'].path),
             
            ),
             ListTile(
              title: Text(
                'Report $ind',
                style: TextStyle(fontSize: 20.0),
              ),
              subtitle: Text(
                '',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            FlatButton(onPressed: null, child: Text('Click to view Location'),)
          ],
        ),
      ),
    );
  }
}
