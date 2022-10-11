import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final Uri _url = Uri.parse('https://github.com/kzlkayayusuf');
  //final _mainUrl= 'https://github.com/kzlkayayusuf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              verticalSpacing(24),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/chatImage.jpg')
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),

              ),
              //Image.asset('assets/chatImage.jpg',height: 150,),
              verticalSpacing(24),
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
              /*TextButton(
                onPressed: _launchUrl,
                child: Text(_mainUrl),
              ),*/
              verticalSpacing(24),
              SocialLoginButton(
                buttonType: SocialLoginButtonType.github,
                onPressed: _launchUrl,
              ),
              Expanded(
                child: Row(
                  children: [
                    SocialMediaButton.twitter(
                      onTap: (){},
                      url: "https://twitter.com/kzlkayayusuf5",
                      size: 28,
                      color: Colors.blue,
                    ),
                    horizontalSpacing(24),
                    SocialMediaButton.linkedin(
                        url: "https://www.linkedin.com/in/kzlkayayusuf25/",
                    ),
                  ],
                ),
                /*Row(
                  children: [
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.twitter,
                      mode: SocialLoginButtonMode.single,
                      onPressed: () {},
                    ),
                    horizontalSpacing(24),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.facebook,
                      mode: SocialLoginButtonMode.single,
                      onPressed: () {},
                    ),
                  ],
                ),*/
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
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
