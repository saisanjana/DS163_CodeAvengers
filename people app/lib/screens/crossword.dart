import 'package:flutter/material.dart';

class CrossWord extends StatefulWidget {
  static const routeName = "cross";
  @override
  _CrossWordState createState() => _CrossWordState();
}

class _CrossWordState extends State<CrossWord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Cross Word"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top:40),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(4),
              child:RaisedButton(onPressed: (){},child:Text("Check"),),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              padding: EdgeInsets.all(10),
              // margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1 / 0.7,
                  crossAxisSpacing: 0.5,
                  mainAxisSpacing: 0.5,
                ),
                itemCount: 84,
                itemBuilder: (ctx, i) => Card(
                    color: Colors.green,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: i == 2
                            ? "1."
                            : (i == 8
                                ? "2."
                                : (i == 24
                                    ? "3"
                                    : (i == 34 ? "4" : (i == 44 ? "5" : "")))),
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "HINTS",
                style:TextStyle(
                  fontFamily: "SourceCodePro",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              //alignment: Alignment.center,
              child: Text(
                "Down:",
                style:TextStyle(
                  fontFamily: "SourceCodePro",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
             SizedBox(
              height: 2,
            ),
             Container(
               padding: EdgeInsets.all(10),
              //alignment: Alignment.center,
              child: Text(
                "1.Endangered bird with large feet and dark brown plumage. ",
                style:TextStyle(
                  fontFamily: "SourceCodePro",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
             Container(
               padding: EdgeInsets.all(10),
              //alignment: Alignment.center,
              child: Text(
                "4. Endangered plant of Andaman which is a genus of parasitic plants ",
                style:TextStyle(
                  fontFamily: "SourceCodePro",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              padding: EdgeInsets.all(10),
              //alignment: Alignment.center,
              child: Text(
                "Side:",
                style:TextStyle(
                  fontFamily: "SourceCodePro",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
             SizedBox(
              height: 2,
            ),
             Container(
               padding: EdgeInsets.all(10),
              //alignment: Alignment.center,
              child: Text(
                "2.This is an eagle which is famous but endangered in Andaman and nicobar",
                style:TextStyle(
                  fontFamily: "SourceCodePro",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              padding: EdgeInsets.all(10),
              //alignment: Alignment.center,
              child: Text(
                "3.Rat - like looking mammal.",
                style:TextStyle(
                  fontFamily: "SourceCodePro",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              //alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                "5.The state animal of Andaman and Nicobar Islands",
                style:TextStyle(
                  fontFamily: "SourceCodePro",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),

            
            


          ],
        ),
      ),
    );
  }
}
