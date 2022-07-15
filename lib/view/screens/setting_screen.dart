import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/logic/ProfileState.dart';
import 'package:fluttertask/view/widgets/text_buttons.dart';
import 'package:fluttertask/view/widgets/title.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../widgets/text_input.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
    // ~ Chek if user is logged or just exploring
    bool isauth = context.read<ProfileProvider>().isAuth;

    // ~ Put user info in text fields
    isauth
        ? _email.text = context.watch<ProfileProvider>().email
        : _email.text = 'exmaple@mail.com';

    // ~ Avatar picture, text & date

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            // ~ Show Avatar Info
            isauth
                ? const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Avatar',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )
                : TitleCustom(title: 'You are not logged in'),
            isauth
                ? FutureBuilder<DocumentSnapshot>(
                    future: context.watch<ProfileProvider>().getInfoSnap,
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          margin: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                foregroundImage:
                                    NetworkImage('${snapshot.data!['avatar']}'),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!['avatar'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Uploaded ${DateFormat("yMMMMd").format(DateTime.parse(snapshot.data!['createdAt']))}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  )
                : const SizedBox(),
            const SizedBox(height: 20),
            // ~ Text input
            isauth
                ? TextInputCustom(
                    label: 'Email',
                    controller: _email,
                    hintText: 'Email',
                  )
                : TextInputCustom(
                    label: 'Email',
                    controller: _email,
                    hintText: 'Email',
                  ),

            const SizedBox(height: 20),
            isauth
                ? FutureBuilder<DocumentSnapshot>(
                    future: context.watch<ProfileProvider>().getInfoSnap,
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done) {
                        _password.text = snapshot.data!['password'];
                        return TextInputCustom(
                          label: 'Password',
                          controller: _password,
                          hintText: 'Password',
                          readOnly: true,
                          ishidden: true,
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  )
                : TextInputCustom(
                    label: 'Password',
                    controller: _password,
                    hintText: 'Password',
                    readOnly: true,
                    ishidden: true,
                  ),
            // ~ "Change" Button
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TextButton(
                onPressed: () => changeEmail(_email.text),
                child: Text(
                  'Change',
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            // ~ LogOut Button
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 180,
                  child: BlueBorderTextButton(
                    onPress: () => logOut(),
                    text: 'Log Out',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // ~ Onclick "Change" button update user email
  void changeEmail(String email) async {
    if (_email.text == context.watch<ProfileProvider>().email) {
      const snackBar = SnackBar(
        content: Text('New email is a same as a old one!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      context.read<ProfileProvider>().updateEmail(email);
    }
  }

  // ~ LogOut User
  void logOut() async {
    context.read<ProfileProvider>().logOut();
    Navigator.popAndPushNamed(context, '/');
  }
}
