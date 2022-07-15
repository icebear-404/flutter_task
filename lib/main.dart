import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/firebase_options.dart';
import 'package:fluttertask/view/screens/login_screen.dart';
import 'package:fluttertask/view/screens/setting_screen.dart';
import 'package:provider/provider.dart';

import 'logic/LoginState.dart';
import 'logic/ProfileState.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ChangeNotifierProvider<ProfileProvider>(
            create: (_) => ProfileProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const LoginScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      initialRoute: context.watch<LoginProvider>().isAuth ? '/settings' : '/',
    );
  }
}
