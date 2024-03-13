import 'package:demo/core/common/common_function.dart';
import 'package:demo/core/constant/z_file_constant.dart';
import 'package:demo/task_screen/get_x_base_code/controller/todolist_controller.dart';
import 'package:demo/task_screen/get_x_base_code/model/task_model.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/technical_task/to_do_add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ToDoTaskScreen extends StatelessWidget {
  const ToDoTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<TaskController>(
      init: TaskController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: CommonWidgets.customTextView(text: "To-Do List"),
            automaticallyImplyLeading: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => const AddTaskScreen());
            },
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
          body: controller.tasks.isNotEmpty
              ? ListView.separated(
                  itemCount: controller.sortedDates.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 18.sp,
                    );
                  },
                  itemBuilder: (context, dateIndex) {
                    DateTime? currentDate = controller.sortedDates[dateIndex];
                    print("currentDate :$dateIndex - $currentDate");
                    List<Task> tasksForDate = controller.groupedTasks[currentDate]!;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (currentDate != null) ...[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.sp),
                            child: Text(
                              DateFormat("MMM dd yyyy").format(currentDate),
                              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                          ),

                        ],
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: tasksForDate.length,
                            padding: EdgeInsets.symmetric(horizontal: 18.sp),
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemBuilder: (context, index) {
                              Task model = tasksForDate[index];
                              return Slidable(
                                endActionPane:ActionPane(
                                  motion: const DrawerMotion() ,
                                  children: [
                                    SlidableAction(
                                      onPressed:  (BuildContext context){
                                        tasksForDate.removeAt(index);
                                        controller.tasks.refresh();
                                        controller.deleteTask(index);

                                      },
                                      backgroundColor: Colors.red.shade500,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                ],
                                )
                              ,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(right: 40.sp),
                                                child: CommonWidgets.customTextView(
                                                  text: model.title ?? "",
                                                  fontSize: 14.sp,
                                                  textDecoration: model.isCompleted ? TextDecoration.lineThrough : null,
                                                ),
                                              ),
                                              CommonWidgets.customTextView(text: DateFormat("hh:mm aa").format(model.date), fontWeight: FontWeight.w400, color: Colors.grey.shade700,),
                                            ],
                                          ),
                                          Checkbox(
                                            value: model.isCompleted,
                                            onChanged: (value) {
                                              model.isCompleted = value!;
                                              controller.tasks.refresh();
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ],
                    );
                  },
                )
              : Center(
                  child: Container(
                    child: CommonWidgets.customTextView(text: "Empty List"),
                  ),
                ),
        );
      },
    );
  }
}

// class ToDoTaskScreen extends StatelessWidget {
//   ToDoTaskScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: GetX<TaskController>(
//         init: TaskController(),
//         builder: (taskController) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('To-Do List'),
//             ),
//             body: ListView.builder(
//               itemCount: taskController.tasks.length,
//               itemBuilder: (context, index) {
//                 final task = taskController.tasks[index];
//                 return ListTile(
//                   title: Text(task.title),
//                   subtitle: Text(task.description),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () => taskController.deleteTask(index),
//                   ),
//                 );
//               },
//             ),
//             floatingActionButton: FloatingActionButton(
//               onPressed: () => Get.to(const AddTaskScreen()),
//               child: Icon(Icons.add),
//             ),
//           );
//         }
//       ),
//     );
//   }
// }
