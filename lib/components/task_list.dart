import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/components/task_tile.dart';
import 'package:todo_app/models/Task.dart';
import 'package:todo_app/screens/new_task.dart';

class TaskList extends StatefulWidget {
  List<Task> taskList;

  TaskList({
    super.key,
    required this.taskList,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tasks",
                style: GoogleFonts.manrope(
                    fontSize: 25, fontWeight: FontWeight.w600)),

            // Add new task button
            IconButton(
              //backgroundColor: Colors.transparent,
              icon: const Icon(
                FluentIcons.add_circle_12_filled,
                size: 34,
                color: Colors.black,
              ),
              onPressed: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => NewTask()))
              },
            ),
          ],
        ),
        SizedBox(height: 10),

        // If no tasks are availible
        (widget.taskList.isEmpty)
            ? const Text("No current tasks for today!")
            :

            // Else, populate task list
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.taskList.length,
                itemBuilder: (context, index) {
                  return TaskTile(
                    task: widget.taskList[index],
                  );
                },
              ),
      ],
    );
  }
}
