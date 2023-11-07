import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/home.dart';

class NewTask extends StatelessWidget {
  const NewTask({super.key});

  void createNewTask() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            children: [
              AppBar(
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      FluentIcons.arrow_previous_20_regular,
                      size: 34,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // do something
                    },
                  )
                ],
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                automaticallyImplyLeading: false,
              ),
              // IconButton(
              //   icon: const Icon(
              //     FluentIcons.arrow_previous_20_regular,
              //     size: 34,
              //     color: Colors.black,
              //   ),
              //   onPressed: () => {Navigator.pushNamed(context, '/home')},
              // ),
              // const SizedBox(height: 63),
              // const Text(
              //   "Title",
              //   style: TextStyle(fontSize: 25),
              // ),
              // const TextField()
            ],
          ),
          Container(
              height: MediaQuery.of(context).size.height, color: Colors.black)
        ],
      ),
    );
  }
}
