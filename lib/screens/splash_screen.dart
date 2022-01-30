import 'package:flutter/material.dart';
import 'package:poi_poi_todo/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey.shade900),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                        size: 50.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      "ToDoList",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "A Simple App To Organize Your Day",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0,
                          color: Colors.white),
                    ),
                    SizedBox(height: 40),
                    Container(
                      height: 40,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        style: raisedButtonStyle,
                        child: Text("Let\'s Start!"),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => LoginPage()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       CircularProgressIndicator.adaptive(
              //         value: 3.0,
              //       ),
              //       Padding(padding: const EdgeInsets.only(top: 20.0))
              //     ],
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.grey[200],
    primary: Colors.blue[900],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6))));
