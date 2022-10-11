import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/picker_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';


class ChatInput extends StatefulWidget {
  ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  final Function(ChatMessageEntity) onSubmit;

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final chatMessageController = TextEditingController();

  String _selectedImageUrl = '';

  Future<void> onSendButtonPressed() async {
    String? userNameFromCache = await  context.read<AuthService>().getUserName();
    print('ChatMessage: ${chatMessageController.text}');

    final newChatMessage = ChatMessageEntity(
        text: chatMessageController.text,
        id: '255',
        createdAt: DateTime.now().microsecondsSinceEpoch,
        author: Author(userName: userNameFromCache!));

    if(_selectedImageUrl.isNotEmpty){
      newChatMessage.imageUrl=_selectedImageUrl;
    }

    widget.onSubmit(newChatMessage);
    chatMessageController.clear();
    _selectedImageUrl='';
    setState(() {

    });
  }

  void onImagePicked(String newImageUrl) {
    setState(() {
      _selectedImageUrl=newImageUrl;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              //open a bottom sheet that shows a grid of images
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return NetworkImagePickerBody(
                      onImageSelected: onImagePicked,
                    );
                  });
            },
            icon: Icon(Icons.add),
            color: Colors.white,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
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
                if (_selectedImageUrl.isNotEmpty)
                  Image.network(_selectedImageUrl,height: 80,),
              ],
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
