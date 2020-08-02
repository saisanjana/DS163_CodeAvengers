import 'package:flutter/material.dart';

class DiscussionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(size.width*0.03),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              padding: EdgeInsets.all(size.width*0.02),
              child: Text(
                "Discuss about how you can save flora and fauna of Andaman as a citizen. This is a forum which is under supervision of government .Please make sure the discussions only contain about protecting environment.",
                style: TextStyle(
                    fontFamily: "SourceCodePro",
                    fontWeight: FontWeight.bold,
                    fontSize: size.width*0.044),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width*0.046),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.indigo, Colors.indigo[600]],
                ),
              ),
            ),
            Container(
              height: size.height * 0.4,
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              padding: EdgeInsets.all(size.width*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: size.height * 0.4,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(size.width*0.044),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "North and middle Andaman",
                          style: TextStyle(
                            fontFamily: "SourceCodePro",
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        RaisedButton(onPressed: (){},child:Text("Join"),),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: size.height * 0.4,
                    width: size.width * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: size.height * 0.17,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(size.width*0.044),
                          ),
                          child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "South Andaman",
                          style: TextStyle(
                            fontFamily: "SourceCodePro",
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        RaisedButton(onPressed: (){},child:Text("Join"),),
                      ],
                    ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: size.height * 0.17,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(size.width*0.044),
                          ),
                          child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Nicobar",
                          style: TextStyle(
                            fontFamily: "SourceCodePro",
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        RaisedButton(onPressed: (){},child:Text("Join"),),
                      ],
                    ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
