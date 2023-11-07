import 'package:flutter/material.dart';

class TaskProgression extends StatelessWidget {
  const TaskProgression({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 110,
            height: 111,
            decoration: const BoxDecoration(color: Colors.black),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 9.0, bottom: 11.0),
                  child: Text(
                    "To Do",
                    style: TextStyle(
                        color: Colors.white, fontSize: 15, letterSpacing: 2),
                  ),
                ),
                Text(
                  "3",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ],
            ),
          ),
          Container(
            width: 110,
            height: 111,
            decoration: const BoxDecoration(color: Colors.black),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 9.0, bottom: 11.0),
                  child: Text(
                    "Completed",
                    style: TextStyle(
                        color: Colors.white, fontSize: 15, letterSpacing: 2),
                  ),
                ),
                Text(
                  "2",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ],
            ),
          ),
          Container(
            width: 110,
            height: 111,
            decoration: const BoxDecoration(color: Colors.black),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 9.0, bottom: 11.0),
                  child: Text(
                    "Past Due",
                    style: TextStyle(
                        color: Colors.white, fontSize: 15, letterSpacing: 2),
                  ),
                ),
                Text(
                  "1",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
