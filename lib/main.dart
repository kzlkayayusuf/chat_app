import 'package:chat_app/chat_page.dart';
import 'package:chat_app/utils/brand_color.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      theme: ThemeData(
        canvasColor: Colors.transparent,
        primarySwatch: BrandColor.primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.deepOrange,
      ),),
      home: LoginPage(),
      routes: {
        '/chat' : (context) => ChatPage(),
      },
    );
  }
}



