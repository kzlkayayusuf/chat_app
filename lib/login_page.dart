import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Button clicked!');
        },
      ),
      body: Column(
        children: [
          Text(
            'Let\'s sign you in!',
            style: TextStyle(
              fontSize: 30,
              color: Colors.brown,
              fontWeight: FontWeight.bold, letterSpacing: 0.5,
            ),
          ),
          Text(
            'Welcome Back! \n You\'ve been missed!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold, letterSpacing: 0.5,
            ),
          ),
          Image.network('https://th.bing.com/th/id/OIP.FsGhfXy7oinbrRqBwcWeigHaEj?w=294&h=181&c=7&r=0&o=5&pid=1.7')
        ],
      ),
    );
  }
}
