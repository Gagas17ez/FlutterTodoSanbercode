import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:poi_poi_todo/screens/LoginScreen.dart';
import 'package:poi_poi_todo/screens/home_screen.dart';

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
      home: LoginPage(),
    );
  }
}
