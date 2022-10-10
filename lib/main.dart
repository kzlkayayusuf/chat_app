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
      theme: ThemeData(primarySwatch: Colors.orange,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.deepOrange,
      ),),
      home: LoginPage(),
    );
  }
}



