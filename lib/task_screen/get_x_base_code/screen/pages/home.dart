import 'package:demo/core/common/common_function.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/logical_task/logical.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/quiz_task/quiz_task_screen.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/static_task/static_task_screen.dart';
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/technical_task/to_do_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: CommonWidgets.customTextView(text: "Logical Task"),
          subtitle: CommonWidgets.customTextView(text: "Distribute coins to the player"),
          trailing: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
          tileColor: Colors.green[900],
          textColor: Colors.white,
          onTap: (){
            Get.to(() => const LogicalScreen());
          },
        ),
        ListTile(
          title: CommonWidgets.customTextView(text: "Technical Task"),
          subtitle: CommonWidgets.customTextView(text: "To-Do List using hive database"),
          trailing: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
          tileColor: Colors.blue[900],
          textColor: Colors.white,
          onTap: (){
            Get.to(() =>  const ToDoTaskScreen());
          },
        ),
        ListTile(
          title: CommonWidgets.customTextView(text: "Quiz Task"),
          subtitle: CommonWidgets.customTextView(text: "Quiz game base on flutter question"),
          trailing: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
          tileColor: Colors.red[900],
          textColor: Colors.white,
          onTap: (){
            Get.to(() =>  const QuizTaskScreen());
          },
        ),
        ListTile(
          title: CommonWidgets.customTextView(text: "Static Screen Task"),
          subtitle: CommonWidgets.customTextView(text: "News setting page"),
          trailing: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
          tileColor: Colors.yellow[900],
          textColor: Colors.white,
          onTap: (){
            Get.to(() =>  const StaticTaskScreen());
          },
        ),
      ],
    );
  }
}
