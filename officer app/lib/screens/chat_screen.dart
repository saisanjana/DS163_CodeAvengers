

import 'package:flutter/material.dart';
import 'package:protecto/widgets/chat/messages.dart';
import 'package:protecto/widgets/chat/new_message.dart';



class ChatScreen extends StatefulWidget {
    static const routeName='/discussions-screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final String location= ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 139, 1),
        title: Text(location,style: TextStyle(color:Colors.white),),
      ),
      body: Container(
        child: Column(
          children: <Widget>[Expanded(child: Messages(location)), NewMessage(location)],
        ),
      ),
    );
  }
}
