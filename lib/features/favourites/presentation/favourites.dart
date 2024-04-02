import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/const/app_color_const.dart';
import 'package:food_delivery/const/app_const.dart';
import 'package:food_delivery/const/app_images_const.dart';
import 'package:food_delivery/utils/bottom_sheet_lang/languageModalSheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:ui' as ui;

class Favourite extends ConsumerStatefulWidget {
  const Favourite({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavouriteState();
}

class _FavouriteState extends ConsumerState<Favourite> {
  bool isLoaded = false;
  Future<void> setTrue() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setTrue();
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.read(localeProvider.notifier);
    return Directionality(
      textDirection: locale.state == Locale('en', 'US')
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(AppConst.favorites,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
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
        body: SingleChildScrollView(
            child: isLoaded
                ? Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 8, right: 8, top: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: CupertinoColors.systemGrey, width: .2),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 95.w,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(
                                        AppImagesConst.discount_rafeeq,
                                      ),
                                    )),
                                  ),
                                  Positioned(
                                      top: 8,
                                      right: 4,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: InkWell(
                                          onTap: () {
                                            print('favourites');
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                top: 6,
                                                right: 6,
                                                bottom: 4,
                                                left: 6),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black26),
                                                color: Colors.black12,
                                                shape: BoxShape.circle),
                                            child: const Center(
                                                child: Icon(
                                              Icons.favorite_border_outlined,
                                              color: Colors.white,
                                            )),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              Container(
                                width: 80.w,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8, top: 8),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Rafeeq Market',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    right: 5),
                                                child: const Icon(
                                                  Icons.star_rounded,
                                                  color: Color.fromARGB(
                                                      255, 250, 226, 10),
                                                  size: 17,
                                                ),
                                              ),
                                              const Text(
                                                '4.1',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              const SizedBox(
                                                width: 150,
                                                child: Text(
                                                  'Best discounted price you will ever get',
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: CupertinoColors
                                                          .systemGrey,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        width: 70,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color:
                                                AppColorConst.kbackgroundGrey),
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.alarm,
                                              size: 15,
                                            ),
                                            Spacer(),
                                            Text(
                                              '44 mins',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 8, right: 8, top: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: CupertinoColors.systemGrey, width: .2),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 95.w,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(
                                        AppImagesConst.discount_rafeeq,
                                      ),
                                    )),
                                  ),
                                  Positioned(
                                      top: 8,
                                      right: 4,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: InkWell(
                                          onTap: () {
                                            print('favourites');
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                top: 6,
                                                right: 6,
                                                bottom: 4,
                                                left: 6),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black26),
                                                color: Colors.black12,
                                                shape: BoxShape.circle),
                                            child: const Center(
                                                child: Icon(
                                              Icons.favorite_border_outlined,
                                              color: Colors.white,
                                            )),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              Container(
                                width: 80.w,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8, top: 8),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Rafeeq Market',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    right: 5),
                                                child: const Icon(
                                                  Icons.star_rounded,
                                                  color: Color.fromARGB(
                                                      255, 250, 226, 10),
                                                  size: 17,
                                                ),
                                              ),
                                              const Text(
                                                '4.1',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              const SizedBox(
                                                width: 150,
                                                child: Text(
                                                  'Best discounted price you will ever get',
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: CupertinoColors
                                                          .systemGrey,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        width: 70,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color:
                                                AppColorConst.kbackgroundGrey),
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.alarm,
                                              size: 15,
                                            ),
                                            Spacer(),
                                            Text(
                                              '44 mins',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 95.w,
                          child: Shimmer.fromColors(
                            direction: ShimmerDirection.ltr,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColorConst.kbackgroundGrey),
                            ),
                            baseColor: Colors.grey.shade100,
                            highlightColor: Colors.grey.shade200,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20.h,
                          width: 95.w,
                          child: Shimmer.fromColors(
                            direction: ShimmerDirection.ltr,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColorConst.kbackgroundGrey),
                            ),
                            baseColor: Colors.grey.shade100,
                            highlightColor: Colors.grey.shade200,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20.h,
                          width: 95.w,
                          child: Shimmer.fromColors(
                            direction: ShimmerDirection.ltr,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColorConst.kbackgroundGrey),
                            ),
                            baseColor: Colors.grey.shade100,
                            highlightColor: Colors.grey.shade200,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20.h,
                          width: 95.w,
                          child: Shimmer.fromColors(
                            direction: ShimmerDirection.ltr,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColorConst.kbackgroundGrey),
                            ),
                            baseColor: Colors.grey.shade100,
                            highlightColor: Colors.grey.shade200,
                          ),
                        ),
                      ],
                    ),
                  )),
      ),
    );
  }
}
