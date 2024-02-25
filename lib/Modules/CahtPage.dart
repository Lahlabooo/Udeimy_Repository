import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(
            child: Text("Chat with me .. ?",style: TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),),
          ),
          SizedBox(height: 15,),
          Icon(FontAwesomeIcons.robot,size: 50,color: Colors.greenAccent,)
        ],
      ),
    );
  }
}
