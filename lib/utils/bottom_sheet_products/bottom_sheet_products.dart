import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/custom_button.dart';
import 'package:food_delivery/const/app_color_const.dart';
import 'package:food_delivery/const/app_const.dart';
import 'package:food_delivery/features/basket/presentation/views/baskets.dart';
import 'package:food_delivery/utils/bottom_bar/bottom_bar.dart';
import 'package:food_delivery/utils/nav_states/nav_notifier.dart';
import 'package:food_delivery/utils/navigation/custom_nav.dart';
import 'package:food_delivery/utils/snack_bar/custome_snack_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductsDetailsPopUp extends ConsumerStatefulWidget {
  final String image;
  final String price;
  final String description;
  ProductsDetailsPopUp(
      {super.key,
      required this.image,
      required this.price,
      required this.description});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductsDetailsPopUpState();
}

class _ProductsDetailsPopUpState extends ConsumerState<ProductsDetailsPopUp> {
  int count = 0;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 67.h,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 6, right: 6, bottom: 4, left: 6),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          color: Colors.white,
                          shape: BoxShape.circle),
                      child: const Center(child: Icon(Icons.close)),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 6, right: 6, bottom: 4, left: 6),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          color: Colors.white,
                          shape: BoxShape.circle),
                      child: const Center(child: Icon(Icons.favorite_outline)),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 6, right: 6, bottom: 4, left: 6),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          color: Colors.white,
                          shape: BoxShape.circle),
                      child: const Center(child: Icon(Icons.upload)),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(widget.image))),
                ),
              ),
              Divider(),
              Container(
                child: Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text(
                  'QAR ' + widget.price,
                  style: TextStyle(
                      color: AppColorConst.kprimaryPurple,
                      fontWeight: FontWeight.w300,
                      fontSize: 17),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                AppConst.addC,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              Container(
                child: TextFormField(
                  controller: _controller,
                  maxLines: 2,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0.5,
                          color: CupertinoColors
                              .systemGrey), // Adjust the opacity as needed
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0.5,
                          color: CupertinoColors
                              .systemGrey), // Adjust the opacity as needed
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0.5,
                          color: CupertinoColors
                              .systemGrey), // Adjust the opacity as needed
                    ),
                    hintText: AppConst.addC,
                    hintStyle: TextStyle(fontSize: 12),
                    prefixIcon: Icon(
                      Icons.comment,
                      size: 12,
                    ), // Set your icon here
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: CupertinoColors.systemGrey),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (count > 0) {
                                    count--;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: CupertinoColors.black,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              count.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  count++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: CupertinoColors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.w, vertical: 1.8.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                13), // Adjust the value as needed
                          ),
                          elevation: 0,
                          backgroundColor: AppColorConst.kprimaryPurple,
                        ),
                        child: Text(
                          'Add 33.00 QAR',
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
