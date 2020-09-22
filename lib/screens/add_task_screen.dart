import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/task_data.dart';

String newTaskTitle;

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'ADD TASK',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[600],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                textAlign: TextAlign.center,
                // autofocus: true,
                cursorColor: Colors.green[800],
                onChanged: (newTask) {
                  newTaskTitle = newTask;
                },
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                // minWidth: 40,
                color: Colors.green[600],
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle ?? '');
                  Navigator.pop(context);
                },
                child: Text(
                  'ADD',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
