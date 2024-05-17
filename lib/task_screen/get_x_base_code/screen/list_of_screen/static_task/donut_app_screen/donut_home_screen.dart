
import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/static_task/donut_app_screen/utils/my_tab.dart';
import 'package:flutter/material.dart';

import 'tabs/burger_tab.dart';
import 'tabs/donut_tab.dart';
import 'tabs/pancake_tab.dart';
import 'tabs/pizza_tab.dart';
import 'tabs/smoothie_tab.dart';



class DonutHomePage extends StatefulWidget {
  const DonutHomePage({super.key});

  @override
  State<DonutHomePage> createState() => _DonutHomePageState();
}

class _DonutHomePageState extends State<DonutHomePage> {
  // my tabs
  List<Widget> myTabs = const [
    // donut tab
    MyTab(
      iconPath: 'assets/icons/donut_icon/donut.png',
    ),

    // burger tab
    MyTab(
      iconPath: 'assets/icons/donut_icon/burger.png',
    ),

    // smoothie tab
    MyTab(
      iconPath: 'assets/icons/donut_icon/smoothie.png',
    ),

    // pancake tab
    MyTab(
      iconPath: 'assets/icons/donut_icon/pancakes.png',
    ),

    // pizza tab
    MyTab(
      iconPath: 'assets/icons/donut_icon/pizza.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.grey[800],
                size: 36,
              ),
              onPressed: () {
                // open drawer
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.grey[800],
                  size: 36,
                ),
                onPressed: () {
                  // account button tapped
                },
              ),
            )
          ],
        ),
        body: Column(
          children: [
            // i want to eat
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 36.0, vertical: 18),
              child: Row(
                children: [
                  Text(
                    'I want to eat',
                    style: TextStyle(fontSize: 24, color: Colors.grey[600]),
                  ),
                  Text(
                    ' EAT',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // tab bar
            TabBar(tabs: myTabs),

            // tab bar view
            Expanded(
              child: TabBarView(
                children: [
                  // donut page
                  DonutTab(),

                  // burger page
                  BurgerTab(),

                  // smoothie page
                  SmoothieTab(),

                  // pancake page
                  PancakeTab(),

                  // pizza page
                  PizzaTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
