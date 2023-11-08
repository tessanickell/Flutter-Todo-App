import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/calendar.dart';
import 'package:todo_app/components/task_list.dart';
import 'package:todo_app/components/task_progression.dart';

import 'package:todo_app/models/Task.dart';
import 'package:todo_app/store/taskstore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Return a list of tasks for todays date
  List<Task> todaysTaskList() {
    return Provider.of<TaskStore>(context, listen: true)
        .taskList
        .where((task) =>
            DateFormat.yMd().format(task.date) ==
            DateFormat.yMd().format(DateTime.now()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leadingWidth: 200.0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            "Today",
            style:
                TextStyle(fontSize: 35, color: Colors.black, letterSpacing: 2),
          ),
        ),
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
                    TaskProgression(todaysTasks: todaysTaskList()),
                    const SizedBox(height: 28),
                    TaskList(
                      taskList: todaysTaskList(),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
