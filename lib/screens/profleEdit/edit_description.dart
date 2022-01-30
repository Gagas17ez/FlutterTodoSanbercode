import 'package:flutter/material.dart';
import '../user_data.dart';
import '../widget/appbar_widget.dart';

// This class handles the Page to edit the About Me Section of the User Profile.
class EditDescriptionFormPage extends StatefulWidget {
  @override
  _EditDescriptionFormPageState createState() =>
      _EditDescriptionFormPageState();
}

class _EditDescriptionFormPageState extends State<EditDescriptionFormPage> {
  final _formKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  void updateUserValue(String description) {
    user.aboutMeDescription = description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade700,
        appBar: buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    width: 310,
                    child: const Text(
                      "Edit Description",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue),
                      textAlign: TextAlign.left,
                    )),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                        height: 250,
                        width: 350,
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length >= 200) {
                              return 'Describe urself under 200 character bro';
                            }
                            return null;
                          },
                          controller: descriptionController,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(10, 15, 10, 100),
                            hintMaxLines: 3,
                            hintText: 'Describe urself here',
                            hintStyle: TextStyle(
                                fontSize: 15, color: Colors.lightBlueAccent),
                          ),
                        ))),
                Padding(
                    padding: EdgeInsets.only(top: 1),
                    child: Align(
                        child: SizedBox(
                      width: 350,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[800],
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            updateUserValue(descriptionController.text);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          'Update',
                          style:
                              TextStyle(fontSize: 15, color: Colors.lightBlue),
                        ),
                      ),
                    )))
              ]),
        ));
  }
}
