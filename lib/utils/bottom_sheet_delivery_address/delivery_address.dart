import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/custom_button.dart';
import 'package:food_delivery/common/custom_form2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DeliveryBottomSheet extends ConsumerStatefulWidget {
  const DeliveryBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DeliveryBottomSheetState();
}

class _DeliveryBottomSheetState extends ConsumerState<DeliveryBottomSheet> {
  TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Positioned(
              top: 50.h,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(20),
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25))),
                child: Column(
                  children: [
                    Text('Delivery Address'.tr()),
                    CustomAppForm2(
                        textEditingController: locationController,
                        lable: 'Current Location',
                        readOnly: false),
                    CustomAppButton(
                        label: 'Continue',
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              ),
            )
          ],
        );
  }
}
