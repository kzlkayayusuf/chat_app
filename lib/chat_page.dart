import 'dart:convert';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: appBarText('Hi $username'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/');
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
                      alignment: _messages[index].author.userName == "yusuf"
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
