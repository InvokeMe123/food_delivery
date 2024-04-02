import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/const/app_const.dart';
import 'package:food_delivery/const/app_images_const.dart';
import 'package:food_delivery/features/my_orders/presentation/views/order_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyOrders extends ConsumerStatefulWidget {
  const MyOrders({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyOrdersState();
}

class _MyOrdersState extends ConsumerState<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text('Orders',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OrderContainer(),
            SizedBox(
              height: 20.h,
            ),
            Center(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Container(
                    height: 30.h,
                    width: 60.w,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImagesConst.noorders))),
                  ),
                ),
                Text(AppConst.noOrders.tr(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                Text(
                  AppConst.noactiveOrder.tr(),
                  style: TextStyle(
                      color: CupertinoColors.systemGrey, fontSize: 12),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
