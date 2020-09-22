import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallBack;
  final Function longpressCallBack;
  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkBoxCallBack,
      this.longpressCallBack});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: longpressCallBack,
        title: Text(
          taskTitle,
          style: TextStyle(
              color: Colors.black,
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.green,
          value: isChecked,
          onChanged: checkBoxCallBack,
        ));
  }
}
