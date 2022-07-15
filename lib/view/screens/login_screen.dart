import 'package:flutter/material.dart';
import 'package:fluttertask/logic/LoginState.dart';
import 'package:fluttertask/view/widgets/text_buttons.dart';
import 'package:provider/provider.dart';

import '../widgets/text_input.dart';
import '../widgets/title.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ~ Title
              TitleCustom(title: 'Welcome'),
              const SizedBox(height: 30),
              // ~ Text Fields
              TextInputCustom(
                label: 'Email',
                hintText: 'e.g. johndoe@mail.com',
                controller: _email,
              ),
              const SizedBox(height: 15),
              TextInputCustom(
                label: 'Password',
                hintText: 'enter password',
                controller: _password,
                ishidden: true,
              ),
              const SizedBox(height: 10),
              // ~ Buttons
              BlueBorderTextButton(
                onPress: () => login(),
                text: 'Login',
              ),
              const SizedBox(height: 10),
              BlueTextButton(
                onPress: () {},
                text: 'Forgot Password',
              ),
              const SizedBox(height: 10),
              // ~ Line with "or"
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Divider(thickness: 2),
                  ),
                  Center(
                    child: Container(
                      width: 30,
                      color: Colors.white,
                      child: const Center(
                        child: Text(
                          'or',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              BlueBorderTextButton(
                isblue: false,
                onPress: () => explore(),
                text: 'Explore The App',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ~ Login & SnacBar
  void login() async {
    String result = await context
        .read<LoginProvider>()
        .userlogin(_email.text, _password.text);
    if (result == 'success') {
      Navigator.popAndPushNamed(context, '/settings');
    } else {
      final snackBar = SnackBar(
        content: Text(result),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  // ~ Setting page w/o loggin
  void explore() {
    Navigator.pushNamed(context, '/settings');
  }
}
