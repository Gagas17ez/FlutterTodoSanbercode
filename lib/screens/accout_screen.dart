//import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
//import 'package:sanberappflutter/Tugas/Tugas11/DrawerScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poi_poi_todo/screens/LoginScreen.dart';
import 'package:poi_poi_todo/screens/home_screen.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:sanberappflutter/Tugas/tugas13/Account.dart';

void main() => runApp(Account(
      email: "",
    ));

class Account extends StatefulWidget {
  String? email;
  Account({Key? key, @required this.email}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  _AccountState();
  @override
  void initState() {
    super.initState();
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (widget.email == null) {
      widget.email = "Ken Dahana";
    }
    final borderRadius = BorderRadius.circular(40);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 2) {
            Route route = MaterialPageRoute(builder: (context) => LoginPage());
            //Navigator.of(context).pushReplacement(route);
            _signOut()
                .then((value) => Navigator.of(context).pushReplacement(route));
          }
          if (value == 0) {
            Route route = MaterialPageRoute(builder: (context) => HomeScreen());
            //Navigator.of(context).pushReplacement(route);
            _signOut().then((value) => Navigator.of(context).pop());
          }
          //else if (value == 1) {
          //     Route route = MaterialPageRoute(builder: (context) => search());
          //     Navigator.of(context).push(route);
          //   } else if (value == 2) {
          //     Route route = MaterialPageRoute(builder: (context) => account());
          //     Navigator.of(context).push(route);
          //   }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.search),
          //   label: 'Search',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Logout',
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.3,
            ),
            Text(
              'Your Email:',
              style: TextStyle(
                color: Colors.blue[300],
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${widget.email}',
              style: TextStyle(
                color: Colors.blue[300],
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget myWidget(BuildContext context) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 300,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.amber,
            child: Center(child: Text('$index')),
          );
        }),
  );
}
