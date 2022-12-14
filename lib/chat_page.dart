import 'dart:convert';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //initiate state of messages
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() async {
    rootBundle.loadString('assets/mock_messages.json').then((response) {
      final List<dynamic> decodedList = jsonDecode(response) as List;
      final List<ChatMessageEntity> _chatMessages = decodedList
          .map((listItem) => ChatMessageEntity.fromJson(listItem))
          .toList();

      print(_chatMessages.length);

      //final state of the messages
      setState(() {
        _messages = _chatMessages;
      });
    }).then((_) => print('done!'));

    print('Something');
  }

  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }


  @override
  void initState() {
    _loadInitialMessages();
    //_getNetworkImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //_getNetworkImages();
    final username = context.watch<AuthService>().getUserName();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: appBarText('Hi $username'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthService>().updateUserName("New Name!");
              },
              icon: Icon(Icons.verified_user_outlined)),
          IconButton(
              onPressed: () {
                context.read<AuthService>().logoutUser();
                Navigator.popAndPushNamed(context, '/');
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                      alignment: _messages[index].author.userName == context.read<AuthService>().getUserName()
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      entity: _messages[index]);
                }),
          ),
          ChatInput(
            onSubmit: onMessageSent,
          ),
        ],
      ),
    );
  }

  Widget appBarText(String title) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 28,
          color: Colors.black,
        ),
      ),
    );
  }
}
