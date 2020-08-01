import 'package:flutter/material.dart';

class DiscussionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
           Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              padding: EdgeInsets.all(10),
              child: Text(
                "Discuss about how you can save flora and fauna of Andaman as a citizen. This is a forum which is under supervision of government .Please make sure the discussions only contain about protecting environment.",
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
                  colors: <Color>[Colors.indigo, Colors.indigo[600]],
                ),
              ),
            ),

        ],
      ),
    );
  }
}
