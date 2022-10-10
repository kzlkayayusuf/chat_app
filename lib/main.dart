import 'package:flutter/material.dart';

import 'login_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Chat App!!!",
      theme: ThemeData(primarySwatch: Colors.orange),
      home: LoginPage(),
    );
  }
}



