import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/const/app_color_const.dart';
import 'package:food_delivery/const/app_images_const.dart';
import 'package:food_delivery/features/my_orders/presentation/views/order_details.dart';
import 'package:food_delivery/utils/navigation/custom_nav.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderContainer extends ConsumerStatefulWidget {
  const OrderContainer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderContainerState();
}

class _OrderContainerState extends ConsumerState<OrderContainer> {
  void orderPop(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return OrderDetails(
            orderName: 'Shopping bag',
            amount: 'QAR 400',
            orderDT: '12 th March,2024 7:45 PM',
            deliveredTo: "NYC",
            image: AppImagesConst.bag);
      },
    );
  }

  @override
  int count = 1;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
              color: CupertinoColors.extraLightBackgroundGray, width: 0.5),
          color: AppColorConst.kbackgroundGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(AppImagesConst.bag),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shopping Bag',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Server: Ramsilik',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: CupertinoColors.systemGrey),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      '4.4',
                      style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                    Text(
                      'Your Reviewed',
                      style: TextStyle(
                          letterSpacing: 0.5,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  '1 Items Ordered',
                  style: TextStyle(
                      letterSpacing: 0.5,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(
                  '12 th March,2024 7:45 PM',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      orderPop(context);
                    },
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColorConst.kprimaryPurple),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'Order details',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColorConst.kprimaryPurple),
                        ))),
                Spacer(),
                Column(
                  children: [
                    Text(
                      'QAR 400',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColorConst.kprimaryPurple),
                    ),
                    Text(
                      'Order Amount',
                      style: TextStyle(
                        letterSpacing: 0.5,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
      ),
    );
  }
}
