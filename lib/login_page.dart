import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/utils/textfield_styles.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    LoginTextField(
                      hintText: "Enter your username",
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return "Your username should be more than 5 characters";
                        } else if (value != null && value.isEmpty) {
                          return "Please type your username";
                        }
                        return null;
                      },
                      controller: userNameController,
                    ),
                    verticalSpacing(24),
                    LoginTextField(
                      hasAsteriks: true,
                      controller: passwordController,
                      hintText: 'Enter your password',
                      validator: (String? value) {},
                    ),
                  ],
                ),
              ),
              verticalSpacing(24),
              ElevatedButton(
                onPressed: () {
                  loginUser(context);
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
                ),
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

  void loginUser(context) {
    if (_formKey != null && _formKey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      //Replacing routes using Navigator
      Navigator.pushReplacementNamed(
        context,
        '/chat',
        arguments: '${userNameController.text}',
      );

      //Navigating via named routes
      /*Navigator.pushNamed(
        context,
        '/chat',
        arguments: '${userNameController.text}',
      );*/

      /* Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(
            username: userNameController.text,
          ),
        ),
      );*/

      print('login successful');
    } else {
      print('login not successful');
    }
  }
}
