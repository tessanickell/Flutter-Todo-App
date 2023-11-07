import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:intl/intl.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  bool dateClicked = false;
  DateTime? selectedDate;

  void editTask() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 8.0),
                  child: GestureDetector(
                    child: const Icon(
                      FluentIcons.arrow_previous_20_regular,
                      size: 34,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                ),
                const SizedBox(height: 63),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title field
                      const Text(
                        "Title",
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                          decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffEFEFEF),
                        border: InputBorder.none,
                      )),
                      const SizedBox(height: 37),

                      // Date field
                      const Text(
                        "Date",
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(height: 10),

                      // If user is not choosing a date
                      (!dateClicked)
                          ? GestureDetector(
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      FluentIcons.calendar_ltr_16_filled,
                                      size: 24,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    (selectedDate != null)
                                        ? DateFormat.yMd().format(selectedDate!)
                                        : "mm/dd/yyyy",
                                    style: const TextStyle(
                                        fontSize: 20, letterSpacing: 2),
                                  ),
                                ],
                              ),

                              // When user clicks text
                              onTap: () {
                                setState(() {
                                  dateClicked = true;
                                });
                              },
                            )

                          // If user is changing date
                          : DatePicker(
                              selectedCellColor: Colors.black,
                              currentDateColor: Colors.black,
                              leadingDateTextStyle: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                              slidersColor: Colors.black,
                              initialDate: (selectedDate != null)
                                  ? selectedDate!
                                  : DateTime.now(),
                              maxDate: DateTime(2099, 12, 31),
                              minDate: DateTime.now(),
                              onDateChanged: ((value) {
                                setState(() {
                                  // Set selected date
                                  selectedDate = value;
                                  // User completed selecting a date
                                  dateClicked = false;
                                });
                              }),
                            ),
                    ],
                  ),
                ),
                const Spacer(),
                // Edit Task Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                          ),
                          onPressed: () => {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 11),
                            child: Text(
                              "Create Task",
                              style: GoogleFonts.manrope(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: const Column(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 27),
                    child: Text(
                      "EDIT TASK",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          letterSpacing: 3.5),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
