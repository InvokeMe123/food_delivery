import 'package:flutter/material.dart';
import 'package:food_delivery/const/app_images_const.dart';
import 'package:food_delivery/utils/products_container/products_container.dart';

class FilterTabBar extends StatefulWidget {
  @override
  _FilterTabBarState createState() => _FilterTabBarState();
}

class _FilterTabBarState extends State<FilterTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3,
        vsync: this); // Change the length according to your number of tabs
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'Food'),
            Tab(text: 'Bike'),
          ], // Add your filter labels here
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              const Row(
                children: [
                  ProductContainer(
                      description:
                          'Fast and furiously doing the things properly an',
                      picture: AppImagesConst.burger,
                      price: '400'),
                  SizedBox(
                    width: 8,
                  ),
                  ProductContainer(
                      description: 'Fast and services ',
                      picture: AppImagesConst.burger,
                      price: '400')
                ],
              ),
              const Row(
                children: [
                  ProductContainer(
                      description:
                          'Fast and furiously doing the things properly an',
                      picture: AppImagesConst.burger,
                      price: '400'),
                  SizedBox(
                    width: 8,
                  ),
                  ProductContainer(
                      description: 'Fast and services ',
                      picture: AppImagesConst.burger,
                      price: '400')
                ],
              ),
              const Row(
                children: [
                  ProductContainer(
                      description:
                          'Fast and furiously doing the things properly an',
                      picture: AppImagesConst.burger,
                      price: '400'),
                  SizedBox(
                    width: 8,
                  ),
                  ProductContainer(
                      description: 'Fast and services ',
                      picture: AppImagesConst.burger,
                      price: '400')
                ],
              )
            ], // Add your filter content here
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
