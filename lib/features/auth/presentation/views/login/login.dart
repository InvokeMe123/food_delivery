import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/custom_button.dart';
import 'package:food_delivery/const/app_const.dart';
import 'package:food_delivery/const/app_fonts.dart';
import 'package:food_delivery/const/app_images_const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  List<String> phoneCode = ['+33 (France)', '+971 (Arab)', '+977 (Nepal)'];
  late String? _selectedCode;
  TextEditingController phoneNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedCode = '+971 (Arab)'; // Initial selected code set to Arab
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

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
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 20.h,
                  width: width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImagesConst.logo))),
                ),
              ),
              Text(
                '${AppConst.login.tr()} or Join Us',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: AppFont.kArabic),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                AppConst.enterMob.tr(),
                style:
                    TextStyle(color: CupertinoColors.systemGrey, fontSize: 12),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 50,
                  width: width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: CupertinoColors.systemGrey, width: .2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: 70,
                    width: width,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 8),
                          width: 125,
                          child: DropdownButton<String>(
                              isExpanded: true,
                              underline: Container(),
                              value: _selectedCode,
                              onChanged: (value) {
                                setState(() {
                                  _selectedCode = value;
                                });
                              },
                              items: phoneCode.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem(
                                    value: value,
                                    child: OverflowBox(
                                      child: Text(
                                        value,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ));
                              }).toList()),
                        ),
                        Container(
                          height: 70,
                          width: .2,
                          decoration: const BoxDecoration(
                              color: CupertinoColors.systemGrey),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            controller: phoneNumber,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CustomAppButton(label: 'Continue', onPressed: () {}),
              ),
              SizedBox(
                height: 22.h,
              ),
              const Text(
                'By continuing you agree to our',
                style:
                    TextStyle(color: CupertinoColors.systemGrey, fontSize: 12),
              ),
              Text(
                AppConst.temrs.tr(),
                style: TextStyle(
                    color: CupertinoColors.destructiveRed, fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
