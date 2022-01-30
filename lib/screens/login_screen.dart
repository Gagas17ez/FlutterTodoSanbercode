import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
//import 'package:sanberappflutter/Tugas/Tugas11/DrawerScreen.dart';
//import 'package:sanberappflutter/Tugas/Tugas12/HomeScreen.dart';
//import 'package:sanberappflutter/Tugas/Tugas15/HomeScreen.dart';
import 'home_screen.dart';

//void main() => runApp(const loginPage());

// class loginPage extends StatelessWidget {
//   const loginPage({Key? key}) : super(key: key);

//   static const String _title = 'Sample App';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         body: const MyStatefulWidget(),
//       ),
//     );
//   }
// }

class LoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  final borderRadius = BorderRadius.circular(20); // Image border
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  registerSubmit() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: (_emailController.text.toString().trim()),
          password: _passwordController.text);
    } catch (e) {
      print(e);
      SnackBar(
        content: Text(e.toString()),
      );
    }
  }

  loginSubmit() async {
    try {
      _firebaseAuth
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen())));
    } catch (e) {
      print(e);
      SnackBar(
        content: Text(e.toString()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 40),
                  child: Text(
                    'Latihan Auth',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 43,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8),
                //   child: Image.network(
                //     "",
                //     height: 100,
                //     width: 100,
                //   ),
                // ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Email"),
                    )),
                Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Password"),
                    )),
                TextButton(onPressed: () {}, child: Text("Forgot Password")),
                Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: raisedButtonStyle,
                    child: Text("Register"),
                    onPressed: () {
                      registerSubmit();
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: raisedButtonStyle,
                    child: Text("Login"),
                    onPressed: () {
                      loginSubmit();
                    },
                  ),
                ),

                // Container(
                //   padding: EdgeInsets.all(10), // Border width
                //   decoration: BoxDecoration(
                //       color: Colors.blue, borderRadius: borderRadius),
                //   child: ClipRRect(
                //     borderRadius: borderRadius,
                //     child: SizedBox.fromSize(
                //       size: Size.fromRadius(48), // Image radius
                //       child: Image.asset(
                //         'assets/img/Roma.png',
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   padding: EdgeInsets.all(10), // Border width
                //   decoration: BoxDecoration(
                //       color: Colors.blue, borderRadius: borderRadius),
                //   child: ClipRRect(
                //     borderRadius: borderRadius,
                //     child: SizedBox.fromSize(
                //       size: Size.fromRadius(48), // Image radius
                //       child: Image.asset(
                //         'assets/img/Monas.png',
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // )
              ],
            )));
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.grey[300],
    primary: Colors.blue[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6))));
