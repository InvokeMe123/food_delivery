import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/const/app_color_const.dart';
import 'package:food_delivery/const/app_const.dart';
import 'package:food_delivery/features/auth/presentation/views/login/login.dart';
import 'package:food_delivery/features/chose_country/presentation/choose_country.dart';
import 'package:food_delivery/utils/bottom_sheet_lang/languageModalSheet.dart';
import 'package:food_delivery/utils/navigation/custom_nav.dart';

class Accounts extends ConsumerStatefulWidget {
  const Accounts({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountsState();
}

class _AccountsState extends ConsumerState<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConst.kextralightbg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text('Account'.tr(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                normalNav(context, const LoginScreen());
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: CupertinoColors.systemGrey, width: .2),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: CupertinoColors.systemGrey,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(AppConst.login.tr()),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: CupertinoColors.systemGrey,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppConst.langandCount.tr(),
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border:
                    Border.all(color: CupertinoColors.systemGrey, width: .2),
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.notifications,
                    color: CupertinoColors.systemGrey,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(AppConst.notification.tr()),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: CupertinoColors.systemGrey,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showLanguageBottomSheet(context);
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: CupertinoColors.systemGrey, width: .2),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.translate,
                      color: CupertinoColors.systemGrey,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(AppConst.language.tr()),
                    Spacer(),
                    Text(
                      AppConst.english,
                      style: TextStyle(
                          color: CupertinoColors.systemGrey, fontSize: 14),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: CupertinoColors.systemGrey,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                normalNav(context, ChooseCountry());
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  border:
                      Border.all(color: CupertinoColors.systemGrey, width: .2),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.public,
                      color: CupertinoColors.systemGrey,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(AppConst.changeC.tr()),
                    Spacer(),
                    Text(
                      AppConst.france.tr(),
                      style: TextStyle(
                          color: CupertinoColors.systemGrey, fontSize: 14),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: CupertinoColors.systemGrey,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppConst.company.tr(),
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border:
                    Border.all(color: CupertinoColors.systemGrey, width: .2),
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.headset_mic,
                    color: CupertinoColors.systemGrey,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(AppConst.contact.tr()),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: CupertinoColors.systemGrey,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border:
                    Border.all(color: CupertinoColors.systemGrey, width: .2),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.group,
                    color: CupertinoColors.systemGrey,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(AppConst.invt.tr()),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: CupertinoColors.systemGrey,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border:
                    Border.all(color: CupertinoColors.systemGrey, width: .2),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info,
                    color: CupertinoColors.systemGrey,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(AppConst.aboutUs.tr()),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: CupertinoColors.systemGrey,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                border:
                    Border.all(color: CupertinoColors.systemGrey, width: .2),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.newspaper,
                    color: CupertinoColors.systemGrey,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(AppConst.temrs.tr()),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: CupertinoColors.systemGrey,
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

void showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return const LanguageBottomSheet();
    },
  );
}
