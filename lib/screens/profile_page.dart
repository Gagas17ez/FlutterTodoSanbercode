import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poi_sanber_todo/screens/home_screen.dart';
import 'package:poi_sanber_todo/screens/login_screen.dart';
import 'edit_profile/edit_description.dart';
import 'edit_profile/edit_email.dart';
import 'edit_profile/edit_image.dart';
import 'edit_profile/edit_name.dart';
import 'edit_profile/edit_phone.dart';
import 'database/user.dart';
import 'database/user_data.dart';
import 'widget/display_image_widget.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:firebase_core/firebase_core.dart';

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _signOut() async {
    await fbAuth.FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.grey[700],
          onTap: (value) {
            if (value == 0) {
              Route route =
                  MaterialPageRoute(builder: (context) => HomeScreen());
              Navigator.of(context).push(route);
            } else if (value == 1) {
              Route route =
                  MaterialPageRoute(builder: (context) => ProfilePage());
              Navigator.of(context).push(route);
            } else if (value == 2) {
              _signOut().then((value) => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage())));
            }
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Logout',
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          Center(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 30, top: 10),
                  child: Text(
                    'Profile Account',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue[300],
                    ),
                  ))),
          InkWell(
              onTap: () {
                navigateSecondPage(EditImagePage());
              },
              child: DisplayImage(
                imagePath: user.image,
                onPressed: () {},
              )),
          buildUserInfoDisplay(user.name, 'Name', EditNameFormPage()),
          buildUserInfoDisplay(user.phone, 'Phone', EditPhoneFormPage()),
          buildUserInfoDisplay(user.email, 'Email', EditEmailFormPage()),
          Expanded(
            child: buildAbout(user),
            flex: 4,
          )
        ],
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
          padding: EdgeInsets.only(bottom: 10, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue[300],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              navigateSecondPage(editPage);
                            },
                            child: Text(
                              getValue,
                              style: TextStyle(
                                  fontSize: 16,
                                  height: 1.4,
                                  color: Colors.white),
                            ))),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 40.0,
                    )
                  ]))
            ],
          ));

  // Widget builds the About Me Section
  Widget buildAbout(User user) => Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.blue[300],
            ),
          ),
          const SizedBox(height: 1),
          Container(
              width: 350,
              height: 150,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Row(children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          navigateSecondPage(EditDescriptionFormPage());
                        },
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  user.aboutMeDescription,
                                  style: TextStyle(
                                      fontSize: 16,
                                      height: 1.4,
                                      color: Colors.white),
                                ))))),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                  size: 40.0,
                )
              ]))
        ],
      ));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
