import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poi_poi_todo/screens/profile_page.dart';
import '../db&models/database.dart';
import '../db&models/note_model.dart';

import 'add_note_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Note>> _noteList;

  final DateFormat _dateFormatter = DateFormat("MMM dd, yyyy");

  DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    _updateNoteList();
  }

  _updateNoteList() {
    _noteList = DatabaseHelper.instance.getNoteList();
  }

  Widget _buildTaskDesign(Note note, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Card(
        color: Colors.grey[700],
        elevation: 2.0,
        child: ListTile(
          title: Text(
            note.title!,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.blue[300],
              decoration: note.status == 0
                  ? TextDecoration.none
                  : TextDecoration.lineThrough,
            ),
          ),
          subtitle: Text(
            '${_dateFormatter.format(note.date!)} - ${note.priority}',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.blue[300],
              decoration: note.status == 0
                  ? TextDecoration.none
                  : TextDecoration.lineThrough,
            ),
          ),
          trailing: Checkbox(
            onChanged: (value) {
              note.status = value! ? 1 : 0;
              DatabaseHelper.instance.updateNote(note);
              _updateNoteList();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            activeColor: Colors.blue[300],
            value: note.status == 1 ? true : false,
          ),
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (_) => AddNoteScreen(
                  updateNoteList: _updateNoteList(),
                  note: note,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  MaterialPageRoute(builder: (context) => ProfilePage());
              Navigator.of(context).push(route);
            } else if (value == 1) {
              Route route =
                  MaterialPageRoute(builder: (context) => HomeScreen());
              Navigator.of(context).push(route);
            } else if (value == 2) {
              // Route route = MaterialPageRoute(builder: (context) => account());
              // Navigator.of(context).push(route);
            }
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[700],
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => AddNoteScreen(
                updateNoteList: _updateNoteList,
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.blue[300],
        ),
      ),
      body: FutureBuilder(
          future: _noteList,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.grey[700],
                ),
              );
            }

            final int completeNoteCount = snapshot.data!
                .where((Note note) => note.status == 1)
                .toList()
                .length;

            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              itemCount: int.parse(snapshot.data.length.toString()) + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 70.0, 10.0, 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Todo Flutter',
                          style: TextStyle(
                            color: Colors.blue[300],
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '$completeNoteCount dari ${snapshot.data.length} tugas Terselesaikan',
                          style: TextStyle(
                            color: Colors.blue[300],
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return _buildTaskDesign(snapshot.data![index - 1], context);
              },
            );
          }),
    );
  }
}
