import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/app/app.dart';
import 'package:food_delivery/core/app_initialize.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:food_delivery/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AppInitialize.appInitialize();
  await SharedPreferences.getInstance();
  await EasyLocalization.ensureInitialized();
  runApp(ProviderScope(
      child: EasyLocalization(
          path: 'assets/translations',
          fallbackLocale: Locale("en", "US"),
          supportedLocales: [Locale("en", "US"), Locale("ar", "AE")],
          child: FoodDeliveryApp())));
}
