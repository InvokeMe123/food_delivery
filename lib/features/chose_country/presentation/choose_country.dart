import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/const/app_color_const.dart';
import 'package:food_delivery/const/app_const.dart';
import 'package:food_delivery/const/app_images_const.dart';
import 'package:food_delivery/utils/snack_bar/custome_snack_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class ChooseCountry extends ConsumerStatefulWidget {
  const ChooseCountry({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChooseCountryState();
}

class _ChooseCountryState extends ConsumerState<ChooseCountry> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: InkWell(
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  AppConst.changeC.tr(),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle the checkbox state when the container is tapped
                    isChecked1 = !isChecked1;
                    isChecked2 = false;
                  });
                  showCustomSnackBar('Changed Successfully', context,
                      isError: false);
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImagesConst.uae,
                          height: 24,
                        ),
                        SizedBox(
                            width:
                                12), // Adjust the width of the gap between the image and checkbox
                        Text(
                          "United Arab Emirates",
                          style: TextStyle(
                            // fontFamily: AppFont.kProductsanfont,
                            letterSpacing: 0.45,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        RoundCheckBox(
                          isChecked: isChecked1,
                          uncheckedColor: Colors.white,
                          size: 25,
                          checkedWidget: Icon(
                            Icons.check_outlined,
                            size: 15,
                            color: Colors.white,
                          ),
                          checkedColor: AppColorConst.kprimaryPurple,
                          onTap: (selected) {
                            setState(() {
                              isChecked1 = selected!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle the checkbox state when the container is tapped
                    isChecked2 = !isChecked2;
                    isChecked1 = false;
                  });
                  showCustomSnackBar('Changed Successfully', context,
                      isError: false);
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImagesConst.france,
                          height: 24,
                        ),
                        SizedBox(
                            width:
                                12), // Adjust the width of the gap between the image and checkbox
                        Text(
                          "France",
                          style: TextStyle(
                            // fontFamily: AppFont.kProductsanfont,
                            letterSpacing: 0.45,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        RoundCheckBox(
                          isChecked: isChecked2,
                          uncheckedColor: Colors.white,
                          size: 25,
                          checkedWidget: Icon(
                            Icons.check_outlined,
                            size: 15,
                            color: Colors.white,
                          ),
                          checkedColor: AppColorConst.kprimaryPurple,
                          onTap: (selected) {
                            setState(() {
                              isChecked2 = selected!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
