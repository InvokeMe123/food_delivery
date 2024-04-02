import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/custom_button.dart';
import 'package:food_delivery/common/custom_form2.dart';
import 'package:food_delivery/const/app_color_const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Location extends ConsumerStatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationState();
}

class _LocationState extends ConsumerState<Location> {
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding:
                  const EdgeInsets.only(top: 6, right: 6, bottom: 4, left: 6),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  color: Colors.white,
                  shape: BoxShape.circle),
              child: const Center(child: Icon(Icons.arrow_back)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
              child: Center(
                child: Text("map",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Container(
              height: 30.h,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Delivery Address'.tr(),
                        style: TextStyle(
                          fontSize: 20.sp,
                          letterSpacing: 0.7,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 20),
                    CustomAppForm2(
                      textEditingController: locationController,
                      readOnly: false,
                      lable: 'Current Location',
                    ),
                    SizedBox(height: 10),
                    CustomAppButton(
                      label: 'Continue',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
