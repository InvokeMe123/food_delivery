import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/core/db_client/dbclient.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final localeProvider = StateProvider<Locale>((ref) {
  // Initialize the default locale when the app starts
  return Locale('en', 'US');
});

class LanguageBottomSheet extends ConsumerStatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends ConsumerState<LanguageBottomSheet> {
  Locale _currentLocale = const Locale('en', 'US');

  @override
  Widget build(BuildContext context) {
    final currentLocale = ref.watch(localeProvider);
    return SizedBox(
      height: 24.h, // Adjust height as needed
      child: Column(
        children: [
          ListTile(
            title: Text('English'.tr()),
            onTap: () {
              // Set English as the selected language

              const newLocale = Locale('en', 'US');
              ref.read(localeProvider.notifier).state =
                  const Locale('en', 'US');
              log(ref.read(localeProvider.notifier).state.toString());

              EasyLocalization.of(context)?.setLocale(newLocale);
              setState(() {
                _currentLocale = newLocale;
              });
            },
          ),
          ListTile(
            title: const Text('عربي'),
            onTap: () {
              // Set Arabic as the selected language
              const newLocale = Locale('ar', 'AE');
              ref.read(localeProvider.notifier).state =
                  const Locale('ar', 'AE');
              log(ref.read(localeProvider.notifier).state.toString());

              EasyLocalization.of(context)?.setLocale(newLocale);
              setState(() {
                _currentLocale = newLocale;
              });
            },
          ),
          ListTile(
            title: const Text('Française'),
            onTap: () {
              // Set French as the selected language
              Navigator.pop(context, 'Française');
              // dbClient?.resetData(dbKey: 'locale');
              // dbClient?.setData(
              //     dbKey: 'locale', value: _currentLocale.toString());
            },
          ),
          // Add more languages as needed
        ],
      ),
    );
  }
}
// final languageProvider = Provider<LanguageBottomSheet>((ref) {
//   return ;
// });