import 'package:demo/core/common/common_function.dart';
import 'package:demo/core/constant/screen_util.dart';
import 'package:demo/task_screen/get_x_base_code/controller/todolist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonWidgets.customTextView(text: 'Add Task'),
      ),
      body: GetBuilder(
        init: TaskController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controller.titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: controller.descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 20.sp),
                TextField(
                  controller: controller.dateController,
                  decoration: const InputDecoration(labelText: 'Due Date', suffixIcon: Icon(Icons.date_range)),
                  onTap: () async {
                    controller.selectedDateTime = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    controller.dateController.text = DateFormat("dd-MM-yyyy").format(controller.selectedDateTime!);
                  },
                ),
                SizedBox(height: 20.sp),
                TextField(
                  controller: controller.timeController,
                  decoration: const InputDecoration(labelText: 'Due Time', suffixIcon: Icon(Icons.access_time)),
                  onTap: () async {
                    TimeOfDay selectedTime =(await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ))!;
                    controller.selectedDateTime = DateTime(
                      controller.selectedDateTime!.year,
                      controller.selectedDateTime!.month,
                      controller.selectedDateTime!.day,
                      selectedTime.hour,
                      selectedTime.minute,
                    );
                    controller.timeController.text = DateFormat.jm().format(controller.selectedDateTime!);
                  },
                ),
                SizedBox(height: 20.sp),
                ElevatedButton(
                  onPressed: () {
                    controller.addButtonTask();
                  },
                  child: CommonWidgets.customTextView(text: 'Add Task'),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
// class AddTaskScreen extends StatelessWidget {
//   const AddTaskScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(
//       init: ToDoListController(),
//       builder: (controller) {
//         return Scaffold(
//           appBar: AppBar(
//             title: CommonWidgets.customTextView(text: 'Add Task'),
//             automaticallyImplyLeading: true,
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 TextField(
//                   controller: controller.taskController,
//                   decoration: const InputDecoration(labelText: 'Task Name'),
//                 ),
//                 SizedBox(height: 16.sp),
//                 TextField(
//                   controller: controller.dueDateController,
//                   decoration: const InputDecoration(labelText: 'Due Date', suffixIcon: Icon(Icons.date_range)),
//                   onTap: () async {
//                     controller.selectedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime(2101),
//                     );
//                     controller.dueDateController.text = DateFormat("dd-MM-yyyy").format(controller.selectedDate!);
//                   },
//                 ),
//                 SizedBox(height: 16.sp),
//                 TextField(
//                   controller: controller.dueTimeController,
//                   decoration: const InputDecoration(labelText: 'Due Time', suffixIcon: Icon(Icons.access_time)),
//                   onTap: () async {
//                     controller.selectedTime = await showTimePicker(
//                       context: context,
//                       initialTime: TimeOfDay.now(),
//                     );
//                     controller.selectedDate = DateTime(
//                       controller.selectedDate!.year,
//                       controller.selectedDate!.month,
//                       controller.selectedDate!.day,
//                       controller.selectedTime!.hour,
//                       controller.selectedTime!.minute,
//                     );
//                     controller.dueTimeController.text = DateFormat.jm().format(controller.selectedDate!);
//                   },
//                 ),
//                 SizedBox(height: 16.sp),
//                 ElevatedButton(
//                   onPressed: () {
//                     controller.saveData();
//                   },
//                   child: CommonWidgets.customTextView(text: 'Add Task'),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
