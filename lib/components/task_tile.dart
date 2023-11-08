import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/delete_dialog_box.dart';
import 'package:todo_app/models/Task.dart';
import 'package:todo_app/screens/edit_task.dart';
import 'package:todo_app/store/taskstore.dart';

// ignore: must_be_immutable
class TaskTile extends StatelessWidget {
  Task task;

  // Constructors
  TaskTile({
    super.key,
    required this.task,
  });

  String capitalize(String word) {
    return "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        // EDIT TASK BUTTON
        SlidableAction(
          onPressed: (_) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditTask(
                  task: task,
                ),
              ),
            );
          },
          backgroundColor: Colors.white,
          icon: FluentIcons.edit_20_filled,
        ),

        // DELETE TASK BUTTON
        SlidableAction(
          onPressed: (_) => {
            showDialog(
              context: context,
              builder: (context) {
                return DeleteTaskDialog(task: task);
              },
            )
          },
          backgroundColor: Colors.black,
          icon: FluentIcons.delete_20_filled,
        ),
      ]),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Checkbox
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: task.isComplete,
              onChanged: (_) => {
                Provider.of<TaskStore>(context, listen: false).taskChecked(task)
              },
              shape: const CircleBorder(),
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (!states.contains(MaterialState.selected)) {
                  return Colors.white;
                }
                return Colors.black;
              }),
            ),
          ),

          // Task Name
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(capitalize(task.title),
                  overflow: TextOverflow.visible,
                  style: GoogleFonts.manrope(
                      fontSize: 18, fontWeight: FontWeight.w600)),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
