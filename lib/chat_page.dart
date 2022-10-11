import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
   ChatPage({Key? key}) : super(key: key);

  List<ChatMessageEntity> _messages= [
    ChatMessageEntity(
      id: '1',
      text: 'your message 1',
      createdAt: DateTime.now().microsecondsSinceEpoch,
      author: Author(userName: 'zeynep'),
    ),
    ChatMessageEntity(
      id: '2',
      text: 'your message 2',
      createdAt: DateTime.now().microsecondsSinceEpoch,
      author: Author(userName: 'zeynep'),
    ),
    ChatMessageEntity(
      id: '3',
      text: 'your message 3',
      createdAt: DateTime.now().microsecondsSinceEpoch,
      author: Author(userName: 'zeynep'),
    ),
    ChatMessageEntity(
      id: '4',
      text: 'your message 4',
      createdAt: DateTime.now().microsecondsSinceEpoch,
      author: Author(userName: 'mustafa'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: appBarText('Hi $username'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context,'/');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                      alignment: _messages[index].author.userName == "zeynep"
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      entity: _messages[index]);
                }),
          ),
          ChatInput(),
        ],
      ),
    );
  }

  Widget appBarText(String title) {
    return Align(
      alignment: Alignment.center,
      child: Text(title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 28,
        color: Colors.black,
      ),),
    );
  }
}
