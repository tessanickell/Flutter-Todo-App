import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/Task.dart';
import 'package:todo_app/store/taskstore.dart';

class EditTask extends StatefulWidget {
  Task task;

  EditTask({super.key, required this.task});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  TextEditingController title = TextEditingController();
  bool dateClicked = false;
  bool _validateTitle = false;
  bool _isValidDate = true;
  DateTime? selectedDate;
  DateTime currentDate = DateTime.now();

  // Give default values on render
  @override
  void initState() {
    title.text = widget.task.title;
    selectedDate = widget.task.date;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08,
                        left: 8.0),
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
                        TextField(
                            controller: title,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xffEFEFEF),
                              border: InputBorder.none,
                              errorStyle:
                                  const TextStyle(color: Colors.redAccent),
                              errorText: _validateTitle
                                  ? "Please enter a task title."
                                  : null,
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
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
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
                                        (Text(
                                          (selectedDate != null)
                                              ? DateFormat.yMd()
                                                  .format(selectedDate!)
                                              : "mm/dd/yyyy",
                                          style: TextStyle(
                                              color: (_isValidDate
                                                  ? Colors.black
                                                  : Colors.redAccent),
                                              fontSize: 20,
                                              letterSpacing: 2),
                                        )),
                                      ],
                                    ),

                                    // When user clicks text
                                    onTap: () {
                                      setState(() {
                                        dateClicked = true;
                                      });
                                    },
                                  ),
                                ],
                              )

                            // If user is changing date
                            : DatePicker(
                                selectedCellColor: Colors.black,
                                currentDateColor: Colors.black,
                                leadingDateTextStyle: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                                slidersColor: Colors.black,
                                initialDate: DateTime(currentDate.year,
                                    currentDate.month, currentDate.day),
                                maxDate: DateTime(2099, 12, 31),
                                minDate: DateTime(currentDate.year,
                                    currentDate.month, currentDate.day),
                                onDateChanged: ((value) {
                                  setState(
                                    () {
                                      _isValidDate = true;
                                      // Set selected date
                                      selectedDate = value;
                                      // User completed selecting a date
                                      dateClicked = false;
                                    },
                                  );
                                }),
                              ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Create Task Button
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
                            onPressed: () {
                              setState(() {
                                _validateTitle = title.text.isEmpty;
                                _isValidDate = (selectedDate != null);
                              });
                              if (!_validateTitle && _isValidDate) {
                                Provider.of<TaskStore>(context, listen: false)
                                    .updateTask(Task(widget.task.id, title.text,
                                        selectedDate!, widget.task.isComplete));
                                Navigator.of(context).pop();
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 11),
                              child: Text(
                                "Update Task",
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
              child: Column(
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: MediaQuery.of(context).size.height * 0.08,
                      ),
                      child: const Text(
                        "EDIT TASK",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            letterSpacing: 3.5),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
