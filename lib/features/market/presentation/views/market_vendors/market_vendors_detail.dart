import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/const/app_color_const.dart';
import 'package:food_delivery/const/app_images_const.dart';
import 'package:food_delivery/features/dashboard/presentation/views/dashboard.dart';
import 'package:food_delivery/features/market/presentation/views/market_vendors/horizontalSlider.dart';
import 'package:food_delivery/utils/bottom_bar/bottom_bar.dart';
import 'package:food_delivery/utils/bottom_sheet_lang/languageModalSheet.dart';
import 'package:food_delivery/utils/filter_silder/filter_slider.dart';
import 'package:food_delivery/utils/nav_states/nav_notifier.dart';
import 'package:food_delivery/utils/navigation/custom_nav.dart';
import 'package:food_delivery/utils/products_container/products_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:ui' as ui;

class MarketVendorDetail extends ConsumerStatefulWidget {
  final String name;
  final String logo;
  final String rating;
  const MarketVendorDetail(
      {super.key,
      required this.name,
      required this.logo,
      required this.rating});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MarketVendorDetailState();
}

class _MarketVendorDetailState extends ConsumerState<MarketVendorDetail> {
  bool isLoaded = false;
  Future<void> setTrue() async {
    await Future.delayed(Duration(seconds: 1));
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
    double width = MediaQuery.sizeOf(context).width;
    return Directionality(
      textDirection: locale.state == Locale('en', 'US')
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              SizedBox(
                height: 500.h,
                width: width,
              ),
              Positioned(
                child: Container(
                  height: 35.h,
                  width: width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(AppImagesConst.discount_rafeeq))),
                ),
              ),
              Positioned(
                top: 8.h,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 6, right: 6, bottom: 4, left: 6),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              color: Colors.white,
                              shape: BoxShape.circle),
                          child: const Center(child: Icon(Icons.arrow_back)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 45.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 6, right: 6, bottom: 4, left: 6),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              color: Colors.white,
                              shape: BoxShape.circle),
                          child: const Center(child: Icon(Icons.search)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 6, right: 6, bottom: 4, left: 6),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              color: Colors.white,
                              shape: BoxShape.circle),
                          child:
                              const Center(child: Icon(Icons.favorite_outline)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 6, right: 6, bottom: 4, left: 6),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              color: Colors.white,
                              shape: BoxShape.circle),
                          child: const Center(child: Icon(Icons.upload)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20.h,
                child: Container(
                  width: width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          widget.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: const Icon(
                                Icons.star_rounded,
                                color: Color.fromARGB(255, 250, 226, 10),
                                size: 25,
                              ),
                            ),
                            const Text(
                              '4.1',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              height: 6,
                              width: 6,
                              decoration: const BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            const SizedBox(
                              width: 150,
                              child: Text(
                                'Tech Accessories',
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: CupertinoColors.systemGrey,
                                    fontWeight: FontWeight.normal),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColorConst.kbackgroundGrey),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.alarm,
                                    size: 15,
                                  ),
                                  Spacer(),
                                  Text(
                                    '44- 68 mins',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              child: const Icon(
                                Icons.info,
                                color: CupertinoColors.systemGrey,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Available till 11:59 am",
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 1,
                          width: width,
                          decoration: const BoxDecoration(
                              color: CupertinoColors.lightBackgroundGray,
                              shape: BoxShape.rectangle),
                        ),
                        // Container(
                        //     height: 400,
                        //     width: double.infinity,
                        //     child: FilterTabBar()),
                        const SizedBox(
                          height: 20,
                        ),
                        FilterOptions(),
                        SizedBox(
                          height: 15,
                        ),
                        isLoaded
                            ? Row(
                                children: [
                                  ProductContainer(
                                      description:
                                          'Fast and furiously doing the things properly and qtuicking is it truely ',
                                      picture: AppImagesConst.burger,
                                      price: '400'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  ProductContainer(
                                      description: 'Fast and services',
                                      picture: AppImagesConst.noorders,
                                      price: '400')
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 32.5.h,
                                      width: 45.w,
                                      child: Shimmer.fromColors(
                                        direction: ShimmerDirection.ltr,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: AppColorConst
                                                  .kbackgroundGrey),
                                        ),
                                        baseColor: Colors.grey.shade100,
                                        highlightColor: Colors.grey.shade200,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 32.5.h,
                                      width: 45.w,
                                      child: Shimmer.fromColors(
                                        direction: ShimmerDirection.ltr,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: AppColorConst
                                                  .kbackgroundGrey),
                                        ),
                                        baseColor: Colors.grey.shade100,
                                        highlightColor: Colors.grey.shade200,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        const SizedBox(
                          height: 10,
                        ),

                        isLoaded
                            ? Row(
                                children: [
                                  ProductContainer(
                                      description:
                                          'Fast and furiously doing the things properly',
                                      picture: AppImagesConst.emptyBasket,
                                      price: '400'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  ProductContainer(
                                      description: 'Fast and services ',
                                      picture: AppImagesConst.burger,
                                      price: '400')
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 32.5.h,
                                      width: 45.w,
                                      child: Shimmer.fromColors(
                                        direction: ShimmerDirection.ltr,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: AppColorConst
                                                  .kbackgroundGrey),
                                        ),
                                        baseColor: Colors.grey.shade100,
                                        highlightColor: Colors.grey.shade200,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 32.5.h,
                                      width: 45.w,
                                      child: Shimmer.fromColors(
                                        direction: ShimmerDirection.ltr,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: AppColorConst
                                                  .kbackgroundGrey),
                                        ),
                                        baseColor: Colors.grey.shade100,
                                        highlightColor: Colors.grey.shade200,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        isLoaded
                            ? Row(
                                children: [
                                  ProductContainer(
                                      description:
                                          'Fast and furiously doing the things properly an',
                                      picture: AppImagesConst.burger,
                                      price: '400'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  ProductContainer(
                                      description: 'Fast and services ',
                                      picture: AppImagesConst.burger,
                                      price: '400')
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 32.5.h,
                                      width: 45.w,
                                      child: Shimmer.fromColors(
                                        direction: ShimmerDirection.ltr,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: AppColorConst
                                                  .kbackgroundGrey),
                                        ),
                                        baseColor: Colors.grey.shade100,
                                        highlightColor: Colors.grey.shade200,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 32.5.h,
                                      width: 45.w,
                                      child: Shimmer.fromColors(
                                        direction: ShimmerDirection.ltr,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: AppColorConst
                                                  .kbackgroundGrey),
                                        ),
                                        baseColor: Colors.grey.shade100,
                                        highlightColor: Colors.grey.shade200,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 16.h,
                  left: 8.w,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(2, 2),
                            blurRadius: 4,
                            color: Colors.grey.withOpacity(0.5),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage(widget.logo), fit: BoxFit.fill)),
                  )),
            ],
          ),
        ),
        floatingActionButton: Container(
          padding: EdgeInsets.all(12),
          width: double.infinity,
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: AppColorConst.kprimaryPurple,
            onPressed: () {
              ref.watch(navProvider.notifier).onIndexChanged(2);
              pushAndRemoveUntil(
                  context,
                  BottomBar(
                    initialIndex: 2,
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'View Basket',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    '0.00',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
