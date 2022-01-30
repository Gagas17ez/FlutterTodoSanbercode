import 'package:flutter/material.dart';
import 'package:poi_sanber_todo/screens/home_screen.dart';
import 'package:poi_sanber_todo/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:poi_sanber_todo/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Flutter',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
