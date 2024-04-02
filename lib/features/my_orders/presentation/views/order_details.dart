import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderDetails extends ConsumerStatefulWidget {
  String orderName;
  String amount;
  String orderDT;
  String deliveredTo;
  String image;

  OrderDetails(
      {super.key,
      required this.orderName,
      required this.amount,
      required this.orderDT,
      required this.deliveredTo,
      required this.image});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends ConsumerState<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Id: #61235",
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.orderDT,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "Delivered",
                  style: TextStyle(
                      color: CupertinoColors.activeGreen, fontSize: 16),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Delivered to',
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 14,
                  color: CupertinoColors.systemGrey),
            ),
            Text(
              'NYC, 2051616',
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Payment Method',
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 14,
                  color: CupertinoColors.systemGrey),
            ),
            Row(
              children: [
                Text(
                  '****32 65',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '  VISA',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              color: CupertinoColors.lightBackgroundGray,
            ),
            Text(
              'Items',
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Image.asset(widget.image),
              title: Text(
                widget.orderName,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                widget.amount,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: CupertinoColors.lightBackgroundGray,
            ),
            Row(
              children: [
                Text(
                  'Sub Total',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(
                  'QAR 400',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Delivery',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(
                  'Free',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'QAR 400',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: CupertinoColors.lightBackgroundGray,
            ),
            SizedBox(
              height: 30,
            ),
            CustomAppButton(label: 'Re-order', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
