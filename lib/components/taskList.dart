import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/components/dialogBox.dart';
import 'package:todo_app/components/taskTile.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  // List of todo's
  List taskList = [
    ["Attend daily standup meeting", false],
    ["Go to gym", false]
  ];

  // Function to check if task was checked/completed
  void taskChecked(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
  }

  // Delete Task
  void deleteTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteTaskDialog(
            onDelete: () => setState(() {
                  taskList.removeAt(index);
                  Navigator.of(context).pop();
                }),
            onCancel: () => Navigator.of(context).pop());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tasks",
                  style: GoogleFonts.manrope(
                      fontSize: 22, fontWeight: FontWeight.w600)),

              // Add new task button
              IconButton(
                //backgroundColor: Colors.transparent,
                icon: Icon(
                  FluentIcons.add_circle_12_filled,
                  size: 34,
                  color: Colors.black,
                ),
                onPressed: () => {Navigator.pushNamed(context, '/newTask')},
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              return TaskTile(
                  taskName: taskList[index][0],
                  taskCompleted: taskList[index][1],
                  onChanged: (value) => taskChecked(value, index),
                  deleteTask: (context) => deleteTask(index));
            },
          ),
        ],
      ),
    );
  }
}
