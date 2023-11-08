import 'package:flutter/material.dart';
import 'package:todo_app/models/Task.dart';

class TaskProgression extends StatelessWidget {
  List<Task> todaysTasks;
  TaskProgression({super.key, required this.todaysTasks});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 120,
            decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 9.0, bottom: 11.0),
                  child: Text(
                    "To Do",
                    style: TextStyle(
                        color: Colors.white, fontSize: 24, letterSpacing: 2),
                  ),
                ),
                Text(
                  todaysTasks
                      .where((task) => !task.isComplete)
                      .length
                      .toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 40),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Container(
            height: 120,
            decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 9.0, bottom: 11.0),
                  child: Text(
                    "Completed",
                    style: TextStyle(
                        color: Colors.white, fontSize: 24, letterSpacing: 2),
                  ),
                ),
                Text(
                  todaysTasks
                      .where((task) => task.isComplete)
                      .length
                      .toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 40),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
