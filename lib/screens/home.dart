import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/components/calendar.dart';
import 'package:todo_app/components/dialog_box.dart';
import 'package:todo_app/components/task_list.dart';
import 'package:todo_app/components/task_progression.dart';
import 'package:todo_app/models/Task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of todo's
  List<Task> taskList = [
    Task("title", DateTime(2023, 11, 7), false),
    Task("duh", DateTime(2023, 11, 7), false)
  ];

  // Return a list of tasks for todays date
  List<Task> todaysTaskList() {
    return taskList
        .where((task) =>
            DateFormat.yMd().format(task.date) ==
            DateFormat.yMd().format(DateTime.now()))
        .toList();
  }

  // Delete task from entire task list
  void deleteTask(Task taskToDelete) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteTaskDialog(
            onDelete: () => setState(() {
                  int index =
                      taskList.indexWhere((task) => task == taskToDelete);
                  taskList.removeAt(index);
                  Navigator.of(context).pop();
                }),
            onCancel: () => Navigator.of(context).pop());
      },
    );
  }

  // Create and append new task
  void createNewTask(Task newTask) {
    setState(() {
      taskList.add(newTask);
    });
  }

  // Function to check if task was checked/completed
  void taskChecked(Task taskToUpdate) {
    setState(() {
      int index = taskList.indexWhere((task) => task == taskToUpdate);
      taskList[index].isComplete = !taskList[index].isComplete;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leadingWidth: 200.0,
          leading: const Text(
            "Today",
            style:
                TextStyle(fontSize: 35, color: Colors.black, letterSpacing: 2),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
            )
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 40),
            const Calendar(),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xffEFEFEF)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 28),
                      const TaskProgression(),
                      const SizedBox(height: 28),
                      TaskList(
                          taskList: todaysTaskList(),
                          createNewTask: createNewTask,
                          deleteTask: deleteTask,
                          isTaskChecked: taskChecked),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
