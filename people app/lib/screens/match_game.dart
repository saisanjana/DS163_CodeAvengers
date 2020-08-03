import 'package:flutter/material.dart';

class MatchGame extends StatefulWidget {
  static const routeName="match";
  @override
  _MatchGameState createState() => _MatchGameState();
}

class _MatchGameState extends State<MatchGame> {
  bool isSuccessful1 = false;
 bool isSuccessful2 = false;
 bool isSuccessful3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drag and Drop"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Draggable(
                  data: 'Hawksbill',
                  child: Container(
                    child: (isSuccessful1 == true
                        ? Emoji(emoji: '✅')
                        : Image.asset("assets/images/hawksbill.jpeg")),
                    height: 150.0,
                    width: 150.0,
                  ),
                  feedback: Container(
                    child: Image.asset("assets/images/hawksbill.jpeg"),
                    height: 150.0,
                    width: 150.0,
                  ),
                  childWhenDragging: Container(),
                ),
                Draggable(
                  data: 'Narcondam Hornabill',
                  child: Container(
                    child: (isSuccessful2 == true
                        ? Emoji(emoji: '✅')
                        : Image.asset("assets/images/narcondam_hornbill.jpeg")),
                    height: 150.0,
                    width: 150.0,
                  ),
                  feedback: Container(
                    child: Image.asset("assets/images/narcondam_hornbill.jpeg"),
                    height: 150.0,
                    width: 150.0,
                  ),
                  childWhenDragging: Container(),
                ),
                Draggable(
                  data: 'Nicobar Megapode',
                  child: Container(
                    child: (isSuccessful3 == true
                        ? Emoji(emoji: '✅')
                        : Image.asset("assets/images/nicobar_megapode.jpeg")),
                    height: 150.0,
                    width: 150.0,
                  ),
                  feedback: Container(
                    child: Image.asset("assets/images/nicobar_megapode.jpeg"),
                    height: 150.0,
                    width: 150.0,
                  ),
                  childWhenDragging: Container(),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                DragTarget(
                  builder: (context, List<String> candidateData, rejectedData) {
                    return Center(
                      child: isSuccessful3
                          ? Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Container(
                                color: Colors.green[800],
                                height: 150.0,
                                width: 150.0,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Nicobar Megapode",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                    Center(
                                      child: Container(
                                        child: Image.asset(
                                            "assets/images/nicobar_megapode.jpeg"),
                                        height: 100.0,
                                        width: 100.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              child: Text(
                                "Nicobar Megapode",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              height: 150.0,
                              width: 150.0,
                              color: Colors.deepPurple[900],
                            ),
                    );
                  },
                  onWillAccept: (data) {
                    if (data == "Nicobar Megapode") {
                      return true;
                    } else {
                      return false;
                    }
                  },
                  onAccept: (data) {
                    setState(() {
                      isSuccessful3 = true;
                    });
                  },
                  onLeave: (data) {},
                ),
                DragTarget(
                  builder: (context, List<String> candidateData, rejectedData) {
                    return Center(
                      child: isSuccessful1
                          ? Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Container(
                                color: Colors.green[800],
                                height: 150.0,
                                width: 150.0,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Hawksbill",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                    Center(
                                      child: Container(
                                        child: Image.asset(
                                            "assets/images/hawksbill.jpeg"),
                                        height: 100.0,
                                        width: 100.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              child: Text(
                                "Hawksbill",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              height: 150.0,
                              width: 150.0,
                              color: Colors.deepPurple[900],
                            ),
                    );
                  },
                  onWillAccept: (data) {
                    if (data == "Hawksbill") {
                      return true;
                    } else {
                      return false;
                    }
                  },
                  onAccept: (data) {
                    setState(() {
                      isSuccessful1 = true;
                    });
                  },
                  onLeave: (data) {},
                ),
                DragTarget(
                  builder: (context, List<String> candidateData, rejectedData) {
                    return Center(
                      child: isSuccessful2
                          ? Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Container(
                                color: Colors.green[800],
                                height: 150.0,
                                width: 150.0,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Narcondam Hornbill",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                    Center(
                                      child: Container(
                                        child: Image.asset(
                                            "assets/images/narcondam_hornbill.jpeg"),
                                        height: 100.0,
                                        width: 100.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              child: Text(
                                "Narcondam Hornabill",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              height: 150.0,
                              width: 150.0,
                              color: Colors.deepPurple[900],
                            ),
                    );
                  },
                  onWillAccept: (data) {
                    if (data == 'Narcondam Hornabill') {
                      return true;
                    } else {
                      return false;
                    }
                  },
                  onAccept: (data) {
                    setState(() {
                      isSuccessful2 = true;
                    });
                  },
                  onLeave: (data) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Emoji extends StatelessWidget {
  Emoji({Key key, this.emoji}) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        padding: EdgeInsets.all(10),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
    );
  }
}