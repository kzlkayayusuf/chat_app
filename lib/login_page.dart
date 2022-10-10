import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Let\'s sign you in!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                'Welcome Back! \n You\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              Image.network(
                  'https://th.bing.com/th/id/OIP.FsGhfXy7oinbrRqBwcWeigHaEj?w=294&h=181&c=7&r=0&o=5&pid=1.7'),
              ElevatedButton(
                onPressed: loginUser,
                child: Text('Click me!' , style: TextStyle(fontSize: 28,fontWeight: FontWeight.w300),),
              ),
              OutlinedButton(
                onPressed: () {},
                child: FlutterLogo(),
              ),
              TextButton(
                onPressed: () {
                  print('Text Button clicked');
                },
                child: Text('https://www.youtube.com/'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginUser() {
    print('login successful');
  }
}
