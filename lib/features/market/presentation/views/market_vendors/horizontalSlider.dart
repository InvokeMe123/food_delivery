import 'package:flutter/material.dart';
import 'package:food_delivery/const/app_color_const.dart';

class FilterOptions extends StatefulWidget {
  @override
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  int selectedIndex = 0;

  final List<String> items = [
    'Burger',
    'Pizza',
    'Biryani',
    'Tacos',
    'Sandwich',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 2,
                            color: selectedIndex == index
                                ? AppColorConst.kprimaryPurple
                                : Colors.transparent))),
                child: Text(
                  items[index],
                  style: TextStyle(
                    decorationColor: AppColorConst.kprimaryPurple,
                    decorationThickness: 4,
                    decorationStyle: TextDecorationStyle.solid,
                    fontWeight: selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
