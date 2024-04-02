import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/const/app_color_const.dart';

class CustomAppForm2 extends StatefulWidget {
  const CustomAppForm2({
    super.key,
    required this.textEditingController,
    this.textInputAction = TextInputAction.next,
    required this.lable,
    this.validator,
    this.onTap,
    this.maxLines = 1,
    this.isPrefixIconrequired = false,
    this.istextCapitilization = false,
    this.inputMaxLenght = 10,
    this.obscureText = false,
    this.suffixIcon,
    required this.readOnly,
    this.ismaxLength = false,
    this.keyboardType = TextInputType.emailAddress,
    this.sufixWidget,
    this.prefixIcon,
    this.onChanged,
    this.isSuffixIconrequired = false,
  });

  final String lable;
  final bool isPrefixIconrequired;
  final bool isSuffixIconrequired;
  final Widget? sufixWidget;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController textEditingController;
  final bool obscureText;
  final bool istextCapitilization;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final bool ismaxLength;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final int inputMaxLenght;
  final bool readOnly;
  final int maxLines;
  final void Function(String)? onChanged;

  @override
  _CustomAppForm2State createState() => _CustomAppForm2State();
}

class _CustomAppForm2State extends State<CustomAppForm2> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(),
            child: TextFormField(
              onChanged: widget.onChanged,
              readOnly: widget.readOnly,
              onTap: widget.onTap,
              cursorColor: CupertinoColors.systemGrey,
              maxLines: widget.maxLines,
              keyboardType: widget.keyboardType,
              maxLength: widget.ismaxLength ? widget.inputMaxLenght : null,
              obscureText: widget.obscureText,
              controller: widget.textEditingController,
              textCapitalization: widget.istextCapitilization
                  ? TextCapitalization.words
                  : TextCapitalization.none,
              validator: widget.validator,
              style: const TextStyle(
                fontSize: 12, // Reduce font size here
                fontWeight: FontWeight.w100,
              ),
              textInputAction: widget.textInputAction,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 15), // Adjust padding here
                counterText: "",
                prefixIcon: widget.isPrefixIconrequired
                    ? Icon(widget.prefixIcon)
                    : null,
                suffixIcon: widget.isSuffixIconrequired
                    ? Align(
                        alignment: Alignment.center,
                        child: Icon(widget.suffixIcon),
                      )
                    : null,
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: .0,
                    color: Colors.black26,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0,
                    color: Colors.black26,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: .0,
                    color: Colors.black26,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                border: InputBorder.none,
                fillColor: AppColorConst.kbackgroundGrey,
                filled: true,
                hintText: widget.lable,
                hintStyle: const TextStyle(
                    fontSize: 12, // Reduce font size here
                    fontWeight: FontWeight.w100,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
