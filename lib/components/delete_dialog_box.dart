import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/Task.dart';
import 'package:todo_app/store/taskstore.dart';

class DeleteTaskDialog extends StatelessWidget {
  final Task task;
  DeleteTaskDialog({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      backgroundColor: Colors.white,
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text("Are you sure you want to delete this task?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w400)),
        SizedBox(height: 43),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Cancel Button
            FilledButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),

                // Dismiss Dialog
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: Text("Cancel",
                      style: GoogleFonts.manrope(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                )),

            // Delete Task Button
            FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                ),
                onPressed: () {
                  Provider.of<TaskStore>(context, listen: false)
                      .deleteTask(task);
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: Text(
                    "Confirm",
                    style: GoogleFonts.manrope(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                )),
          ],
        )
      ]),
    );
  }
}
