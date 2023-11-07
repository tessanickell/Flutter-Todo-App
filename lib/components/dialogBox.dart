import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteTaskDialog extends StatelessWidget {
  VoidCallback onDelete;
  VoidCallback onCancel;

  DeleteTaskDialog({
    super.key,
    required this.onDelete,
    required this.onCancel,
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
                onPressed: onCancel,
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
                onPressed: onDelete,
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
