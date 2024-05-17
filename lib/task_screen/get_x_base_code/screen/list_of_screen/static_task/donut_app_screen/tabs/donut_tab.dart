import 'package:demo/task_screen/get_x_base_code/screen/list_of_screen/static_task/donut_app_screen/utils/donut_tile.dart';
import 'package:flutter/material.dart';


class DonutTab extends StatelessWidget {
  // list of donuts
  List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "36", Colors.blue, "assets/icons/donut_icon/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "assets/icons/donut_icon/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "assets/icons/donut_icon/grape_donut.png"],
    ["Choco", "95", Colors.brown, "assets/icons/donut_icon/chocolate_donut.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutsOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.6,
      ),
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutPrice: donutsOnSale[index][1],
          donutColor: donutsOnSale[index][2],
          imageName: donutsOnSale[index][3],
        );
      },
    );
  }
}
