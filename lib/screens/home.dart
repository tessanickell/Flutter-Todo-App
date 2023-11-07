import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/components/calendar.dart';
import 'package:todo_app/components/dialogBox.dart';
import 'package:todo_app/components/taskList.dart';
import 'package:todo_app/components/taskProgression.dart';
import 'package:todo_app/screens/newTask.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leadingWidth: 15.0,
          title: Text(
            "Today",
            style:
                TextStyle(fontSize: 35, color: Colors.black, letterSpacing: 2),
          ),
          actions: [
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 28),
                      TaskProgression(),
                      SizedBox(height: 28),
                      TaskList(),
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
