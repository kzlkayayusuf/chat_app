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
        title: Text('Hi Yusuf'),
        actions: [
          IconButton(
              onPressed: () {
                print("Button clicked");
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ChatBubble(
                    alignment: Alignment.centerRight, message: "your message"),
                ChatBubble(
                    alignment: Alignment.centerLeft, message: "your message"),
                ChatBubble(
                    alignment: Alignment.centerRight, message: "your message"),
                ChatBubble(
                    alignment: Alignment.centerRight, message: "your message"),
              ],
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
