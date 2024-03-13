import 'package:demo/core/constant/z_file_constant.dart';
import 'package:demo/my_dashboard_screen/my_dashboard_screen.dart';
import 'package:demo/task_screen/get_x_base_code/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{

  //initialize hive
  await Hive.initFlutter();

  //open a hive box
  await Hive.openBox("expense_database");
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('tasks');
  // It will delete all the entry in the box
  // await Hive.box<TaskModel>('tasks').clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(FIGMA_DESIGN_WIDTH, FIGMA_DESIGN_HEIGHT),
        allowFontScaling: false,
        builder: () {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
              useMaterial3: true,
            ),
            home: const MyDashboard(),
          );
        });
  }
}
