import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: appBarText('Hi Yusuf'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ChatBubble(
                      alignment: index % 2 == 0
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      message: "your message");
                }),
          ),
          ChatInput(),
        ],
      ),
    );
  }

  appBarText(title) {
    return Align(
      alignment: Alignment.center,
      child: Text('$title',
      style: TextStyle(
        fontSize: 28,
        color: Colors.black,
      ),),
    );
  }
}
