import 'package:flutter/material.dart';
import 'package:food_delivery/const/app_color_const.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton(
      {required this.label,
      super.key,
      this.bioMetricsOnpress,
      required this.onPressed,
      this.isLable = true,
      this.width = 0.85,
      this.free,
      this.bottonBgColor = AppColorConst.kprimaryPurple,
      this.lableColor = Colors.white});

  final String label;
  final void Function()? onPressed;
  final Color lableColor;
  final Color bottonBgColor;
  final bool isLable;
  final double width;
  final IconData? free;

  final void Function()? bioMetricsOnpress;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: MediaQuery.sizeOf(context).width),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(0, 55),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(16), // Adjust the value as needed
            ),
            elevation: 0,
            backgroundColor: bottonBgColor,
          ),
          onPressed: onPressed,
          child: isLable
              ? Text(
                  label,
                  style: TextStyle(
                      //fontFamily: AppFont.mProductsanfont,
                      color: lableColor,
                      fontSize: 14,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      free,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    Text(
                      label,
                      style: TextStyle(
                          //fontFamily: AppFont.mProductsanfont,
                          color: lableColor,
                          letterSpacing: 0.25,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
    );
  }
}
