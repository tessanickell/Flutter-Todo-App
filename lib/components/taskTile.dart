import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/screens/editTask.dart';

// ignore: must_be_immutable
class TaskTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;
  // Function(BuildContext)? editTask;

  // Constructors
  TaskTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteTask,
    // required this.editTask,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        // SlidableAction(
        //   // An action can be bigger than the others.
        //   flex: 2,
        //   onPressed: editTask,
        //   backgroundColor: Colors.white,
        //   icon: FluentIcons.edit_20_filled,
        // ),
        SlidableAction(
          onPressed: deleteTask,
          backgroundColor: Colors.white,
          icon: FluentIcons.delete_20_filled,
        ),
      ]),
      child: Container(
        child: Row(
          children: [
            //Checkbox
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              shape: const CircleBorder(),
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (!states.contains(MaterialState.selected)) {
                  return Colors.white;
                }
                return null;
              }),
            ),

            // Task Name
            Text(taskName),
          ],
        ),
      ),
    );
  }
}
