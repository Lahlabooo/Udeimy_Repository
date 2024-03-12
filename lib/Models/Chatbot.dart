import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Modules/HomeLayout.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  ChatUser myself = ChatUser(id: "1", firstName: "Me");
  ChatUser bot = ChatUser(id: "2", firstName: "Chat GPT");
  List<ChatMessage> allMassages = [];
  List<ChatUser> typing=[];

  final ourUrl="https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyALbFlTaCml13rcs9svyeEIU3jx2N3nLCY";
  final header={
    'Content-Type': 'application/json'
  };

  getData(ChatMessage m) async {
    typing.add(bot);
    allMassages.insert(0, m);
    setState(() {

    });
    var data={"contents":[{"parts":[{"text":m.text}]}]};

    await http.post(Uri.parse(ourUrl),headers: header,body: jsonEncode(data)).
    then((value){
      if(value.statusCode==200){
        var result=jsonDecode(value.body);
        print(result["candidates"][0]["content"]["parts"][0]["text"]);
        ChatMessage m1=ChatMessage(
          user: bot,
          createdAt: DateTime.now(),
          text: result["candidates"][0]["content"]["parts"][0]["text"],
        );
        allMassages.insert(0, m1);

      }else{
        print("Error occurred");
      }
    }).
    catchError((e){});
    typing.remove(bot);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[300],
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple,
                ),
                 width: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: IconButton(icon: const Icon(Icons.arrow_back_ios,size: 20,),
                    color: Colors.white,

                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>const HomeLayout(),)
                      );
                    },),
                ),
              ),
            ),
            SizedBox(width: 40,),
            Text("Chat with ME",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,

            ),),
          ],
        ),
      ),
      body: DashChat(
        messageOptions: MessageOptions(
            showTime: true,
            textColor: Colors.black,
            containerColor: Colors.white,
        ),
        typingUsers: typing,
        currentUser: myself,
        onSend: (ChatMessage m) {
          getData(m);
        },
        messages: allMassages,
      ),
    );
  }
}
