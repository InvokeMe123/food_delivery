import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/utils/bottom_bar/bottom_bar.dart';
import 'package:food_delivery/utils/bottom_sheet_lang/languageModalSheet.dart';
import 'package:food_delivery/wrapper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class FoodDeliveryApp extends ConsumerStatefulWidget {
  FoodDeliveryApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FoodDeliveryAppState();
}

class _FoodDeliveryAppState extends ConsumerState<FoodDeliveryApp> {
  @override
  Widget build(BuildContext context) {
    var local = ref.read(localeProvider.notifier);
    log(local.toString() + ' food delivery');
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        //theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Directionality(
          textDirection: local.state == const Locale('en', 'US')
              ? ui.TextDirection.ltr
              : ui.TextDirection.rtl,
          child: Wrapper()
        ),
      );
    });
  }
}
