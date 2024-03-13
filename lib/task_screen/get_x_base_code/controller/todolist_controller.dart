import 'package:demo/task_screen/get_x_base_code/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class TaskController extends GetxController {
  RxList<Task> tasks = RxList([]);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  DateTime? selectedDateTime;

  // Group tasks by date
  Map<DateTime?, List<Task>> groupedTasks = {};
  RxList<DateTime?> sortedDates = RxList([]);

  @override
  void onInit() {
    super.onInit();
    openBox();
    loadTasks();
  }

  addButtonTask() {
    final dueDate = dateController.text;
    final dueTime = timeController.text;
    DateTime? parsedDate;
    DateTime? selectedDateTime;
    if (dueDate.isNotEmpty) {
      parsedDate = DateFormat("dd-MM-yyyy").parse(dueDate);
      print("Parsed Date1 $dueDate $parsedDate");
      if (dueTime.isNotEmpty) {
        final parsedTime = DateFormat.jm().parse(dueTime);
        print("Parsed Time 1 $dueTime $parsedTime");
        selectedDateTime = DateTime(
          parsedDate.year,
          parsedDate.month,
          parsedDate.day,
          parsedTime.hour,
          parsedTime.minute,
        );
      }
    }

    if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty && selectedDateTime != null) {
      addTask(
        title: titleController.text,
        description: descriptionController.text,
        date: selectedDateTime ?? DateTime.now(),
        isComplete: false,
      );
      print("Parsed Date $selectedDateTime");
      Get.back();
    } else {
      Get.snackbar('Error', 'Please fill in all fields.');
    }
  }

  dateWiseList() {
    // Group tasks by date
    groupedTasks = {};
    for (var task in tasks) {
      DateTime? taskDate = task.date;

      if (!groupedTasks.containsKey(taskDate)) {
        groupedTasks[taskDate] = [];
      }

      groupedTasks[taskDate]!.add(task);
    }
    // Extract sorted date keys
    sortedDates.value = groupedTasks.keys.toList()..sort((a, b) => a!.compareTo(b!));
  }

  Future<void> openBox() async {
    await Hive.openBox<Task>('tasks');
  }

  Future<void> loadTasks() async {
    final box = Hive.box<Task>('tasks');
    tasks.assignAll(box.values.toList());
    dateWiseList();
  }

  Future<void> addTask({
    required String title,
    required String description,
    required DateTime date,
    required bool isComplete,
  }) async {
    final box = Hive.box<Task>('tasks');
    final task = Task(
      title: title,
      description: description,
      date: date,
      isCompleted: isComplete,
    );
    await box.add(task);
    tasks.add(task);
    print("Added parse Date : $date");
    dateWiseList();
    clear();
    update();
  }

  Future<void> deleteTask(int index) async {
    final box = Hive.box<Task>('tasks');
    await box.deleteAt(index);
    tasks.removeAt(index);
    update();
  }

  clear() {
    timeController.clear();
    dateController.clear();
    descriptionController.clear();
    titleController.clear();
  }
}
