import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/screens/add_task_screen.dart';
import 'package:todo/widgets/task_list.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, bottom: 10),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.blueGrey[700],
                  //       blurRadius: 10,
                  //       offset: Offset(3, 4))
                  // ],
                ),
                child: Icon(
                  Icons.list,
                  size: 40,
                  color: Colors.lightGreen,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, bottom: 10),
              child: Text('TODO',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Colors.green[900],
                      letterSpacing: 3)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, bottom: 10),
              child: Text('${tasks.length} tasks',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.green[900],
                      letterSpacing: 3)),
            ),
            Expanded(
              child: Container(
                // width: double.infinity,
                // color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: TaskList(tasks),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.greenAccent[700],
            hoverColor: Colors.green[700],
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => AddTaskScreen((newTaskTitle) {
                        setState(() {
                          tasks.add(Task(name: newTaskTitle));
                        });
                        Navigator.pop(context);
                      }));
            },
            label: Icon(
              Icons.add_circle,
              size: 30,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
