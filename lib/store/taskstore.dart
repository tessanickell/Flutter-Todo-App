import 'package:flutter/material.dart';
import 'package:todo_app/models/Task.dart';

class TaskStore extends ChangeNotifier {
  List<Task> taskList = [
    Task(0, "Take buddy the dog out for a walk", DateTime(2023, 11, 7), false),
    Task(1, "Pick up buddy's poo", DateTime(2023, 11, 7), false)
  ];

  void addTask(Task task) {
    taskList.add(task);
    notifyListeners();
  }

  // Function to check if task was checked/completed
  void taskChecked(Task taskToUpdate) {
    int index = taskList.indexWhere((task) => task.id == taskToUpdate.id);
    taskList[index].isComplete = !taskList[index].isComplete;
    notifyListeners();
  }

  void updateTask(Task taskToUpdate) {
    int index = taskList.indexWhere((task) => task.id == taskToUpdate.id);
    taskList[index].title = taskToUpdate.title;
    taskList[index].date = taskToUpdate.date;

    notifyListeners();
  }

  void deleteTask(Task taskToDelete) {
    int index = taskList.indexWhere((task) => task.id == taskToDelete.id);
    taskList.removeAt(index);
    notifyListeners();
  }
}
