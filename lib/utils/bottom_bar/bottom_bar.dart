import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/const/app_color_const.dart';
import 'package:food_delivery/features/account/presentation/views/accounts.dart';
import 'package:food_delivery/features/basket/presentation/views/baskets.dart';
import 'package:food_delivery/features/dashboard/presentation/views/dashboard.dart';
import 'package:food_delivery/features/my_orders/presentation/views/my_orders.dart';
import 'package:food_delivery/utils/nav_states/nav_notifier.dart';

class BottomBar extends ConsumerStatefulWidget {
  final int initialIndex;
  const BottomBar({super.key, required this.initialIndex});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends ConsumerState<BottomBar> {
  int itemCount = 6;
  static final List<Widget> _widgetOptions = [
    const Dashboard(),
    const MyOrders(),
    const Baskets(),
    const Accounts(),
  ];
  late int _index;
  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    var navIndex = ref.watch(navProvider);
    return Scaffold(
      body: Center(
        child: _widgetOptions[navIndex.index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: AppColorConst.kprimaryPurple,
            ),
            icon: Icon(
              Icons.home,
              color: CupertinoColors.systemGrey,
            ),
            label: 'Home'.tr(),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.receipt_long,
              color: AppColorConst.kprimaryPurple,
            ),
            icon: Icon(
              Icons.receipt_long,
              color: CupertinoColors.systemGrey,
            ),
            label: 'My Orders'.tr(),
          ),
          // Example count

          BottomNavigationBarItem(
            activeIcon: Stack(
              children: [
                Icon(
                  Icons.shopping_basket_outlined,
                  color: AppColorConst.kprimaryPurple,
                ),
                if (itemCount > 0)
                  Positioned(
                    left: 8,
                    bottom: 6,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: AppColorConst.kprimaryPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        itemCount.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            icon: Stack(
              children: [
                Icon(
                  Icons.shopping_basket_outlined,
                  color: CupertinoColors.systemGrey,
                ),
                if (itemCount > 0)
                  Positioned(
                    left: 8,
                    bottom: 6,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        itemCount.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            label: 'Baskets.'.tr(),
          ),

          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.account_circle_rounded,
              color: AppColorConst.kprimaryPurple,
            ),
            icon: Icon(
              Icons.account_circle_rounded,
              color: CupertinoColors.systemGrey,
            ),
            label: 'Account'.tr(),
          ),
        ],
        currentIndex: _index,
        selectedItemColor: AppColorConst.kprimaryPurple,
        onTap: (int index) {
          setState(() {
            _index = index;
            ref.read(navProvider.notifier).onIndexChanged(index);
          });
        },
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
