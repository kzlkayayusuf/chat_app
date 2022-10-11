import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  ChatInput({Key? key,required this.onSubmit}) : super(key: key);

  final chatMessageController = TextEditingController();
  final Function(ChatMessageEntity) onSubmit;

  void onSendButtonPressed() {
    print('ChatMessage: ${chatMessageController.text}');

    final newChatMessage = ChatMessageEntity(
        text: chatMessageController.text,
        id: '255',
        createdAt: DateTime.now().microsecondsSinceEpoch,
        author: Author(userName: 'yusuf'));
    onSubmit(newChatMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            color: Colors.white,
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
              controller: chatMessageController,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Type your message",
                hintStyle: TextStyle(color: Colors.blueGrey),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: onSendButtonPressed,
            icon: Icon(Icons.send),
            color: Colors.white,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    );
  }
}
