import 'package:chat_app/chat_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AuthService(),
      child: ChatApp()));
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
        ),
      ),
      home: FutureBuilder<bool>(
        future: context.read<AuthService>().isLoggedIn(),
        builder: (context,AsyncSnapshot<bool> snapshot) {
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasData && snapshot.data!){
              return ChatPage();
            }else return  LoginPage();
          }
          return CircularProgressIndicator();
        },
      ),
      routes: {
        '/chat': (context) => ChatPage(),
      },
    );
  }
}
