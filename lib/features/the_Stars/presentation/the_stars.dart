import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/custom_form.dart';
import 'package:food_delivery/const/app_color_const.dart';
import 'package:food_delivery/const/app_const.dart';
import 'package:food_delivery/const/app_fonts.dart';
import 'package:food_delivery/const/app_images_const.dart';
import 'package:food_delivery/features/auth/presentation/views/login/login.dart';
import 'package:food_delivery/features/market/presentation/views/market_vendors/market_vendors_detail.dart';
import 'package:food_delivery/features/market/presentation/views/offer_and_discount/offerdiscount.dart';
import 'package:food_delivery/utils/bottom_sheet_lang/languageModalSheet.dart';
import 'package:food_delivery/utils/navigation/custom_nav.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:ui' as ui;

class TheStars extends ConsumerStatefulWidget {
  const TheStars({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TheStarsState();
}

class _TheStarsState extends ConsumerState<TheStars> {
  TextEditingController searchController = TextEditingController();
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
    double width = MediaQuery.sizeOf(context).width;
    final locale = ref.read(localeProvider.notifier);
    return Directionality(
      textDirection: locale.state == Locale('en', 'US')
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: GestureDetector(
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
          toolbarHeight: 120,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 10, right: 10, bottom: 8, left: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                color: Colors.white,
                                shape: BoxShape.circle),
                            child: const Center(child: Icon(Icons.arrow_back)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: const Text(
                              AppConst.deliveringTo,
                              style: TextStyle(
                                  fontFamily: AppFont.kArabic,
                                  color: CupertinoColors.systemGrey,
                                  fontSize: 12),
                            )),
                            const Row(
                              children: [
                                Text(
                                  'Ras Laffan',
                                  style: TextStyle(
                                      fontFamily: AppFont.kArabic,
                                      color: CupertinoColors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 30,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          children: [
                            const Text(
                              AppConst.login,
                              style: TextStyle(
                                  fontFamily: AppFont.kArabic,
                                  color: CupertinoColors.systemGrey,
                                  fontSize: 12),
                            ),
                            GestureDetector(
                              onTap: () {
                                normalNav(context, const LoginScreen());
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 4, right: 10, bottom: 8, left: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors
                                            .black), // Change border color when tapped
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: const Center(child: Icon(Icons.person)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomAppForm(
                        textEditingController: searchController,
                        lable: AppConst.search,
                        prefixIcon: Icons.search,
                        isPrefixIconrequired: true,
                        readOnly: false),
                  )
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: isLoaded
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text(
                              "All Stars",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {},
                                child: const Row(
                                  children: [
                                    Text(
                                      'See All',
                                      style: TextStyle(
                                          color: AppColorConst.kprimaryPurple),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        size: 15,
                                        color: AppColorConst.kprimaryPurple)
                                  ],
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //top brands
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 22.w,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImagesConst.brand1)),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                    ),
                                    const Text(
                                      'Khasquir',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 22.w,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImagesConst.brand2)),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                    ),
                                    const Text(
                                      "Yamjamnu",
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 22.w,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImagesConst.brand3)),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                    ),
                                    const Text(
                                      'Rasailasq',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 22.w,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImagesConst.brand4)),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                    ),
                                    const Text(
                                      'Plaza Laqueer',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 22.w,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImagesConst.brand1)),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                    ),
                                    const Text(
                                      'Khasquir',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 22.w,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImagesConst.brand2)),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                    ),
                                    const Text(
                                      "Yamjamnu",
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 22.w,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImagesConst.brand3)),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                    ),
                                    const Text(
                                      'Rasailasq',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 22.w,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImagesConst.brand4)),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                    ),
                                    const Text(
                                      'Plaza Laqueer',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //offers and discount
                        Row(
                          children: [
                            const Text(
                              "Stars",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {
                                  //
                                },
                                child: const Row(
                                  children: [
                                    Text(
                                      'See All',
                                      style: TextStyle(
                                          color: AppColorConst.kprimaryPurple),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        size: 15,
                                        color: AppColorConst.kprimaryPurple)
                                  ],
                                ))
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 22.w,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImagesConst.brand1)),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                    ),
                                    const Text(
                                      'Khasquir',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 22.w,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImagesConst.brand2)),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                    ),
                                    const Text(
                                      "Yamjamnu",
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 22.w,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImagesConst.brand3)),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                    ),
                                    const Text(
                                      'Rasailasq',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 22.w,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImagesConst.brand4)),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                    ),
                                    const Text(
                                      'Plaza Laqueer',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text(
                              AppConst.ourStores,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {},
                                child: const Row(
                                  children: [
                                    Text(
                                      'See All',
                                      style: TextStyle(
                                          color: AppColorConst.kprimaryPurple),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        GestureDetector(
                          onTap: () {
                            normalNav(
                                context,
                                const MarketVendorDetail(
                                    name: "Rafeeq Market",
                                    logo: AppImagesConst.allvendor1,
                                    rating: '4.7'));
                          },
                          child: Container(
                            width: width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: CupertinoColors.systemGrey,
                                    width: .2),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 120,
                                        width: width,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                          image: AssetImage(
                                            AppImagesConst.allvendor1,
                                          ),
                                        )),
                                      ),
                                      Positioned(
                                          top: 8,
                                          right: 4,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
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
                                                  Icons
                                                      .favorite_border_outlined,
                                                  color: Colors.white,
                                                )),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                  Container(
                                    width: double
                                        .infinity, // Set your desired width for the container
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
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
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
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          color: CupertinoColors
                                                              .systemGrey,
                                                          fontWeight: FontWeight
                                                              .normal),
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
                                                color: AppColorConst
                                                    .kbackgroundGrey),
                                            child: const Row(
                                              children: [
                                                Icon(
                                                  Icons.alarm,
                                                  size: 15,
                                                ),
                                                Spacer(),
                                                Text(
                                                  '44 mins',
                                                  style:
                                                      TextStyle(fontSize: 12),
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
                        ),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 12.h,
                              width: 45.w,
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
                              height: 12.h,
                              width: 45.w,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 10.h,
                              width: 20.w,
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
                              height: 10.h,
                              width: 20.w,
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
                              height: 10.h,
                              width: 20.w,
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
                              height: 10.h,
                              width: 20.w,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 4),
                        child: SizedBox(
                          height: 2.h,
                          width: 30.w,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 12.h,
                              width: 45.w,
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
                              height: 12.h,
                              width: 45.w,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 10.h,
                              width: 20.w,
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
                              height: 10.h,
                              width: 20.w,
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
                              height: 10.h,
                              width: 20.w,
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
                              height: 10.h,
                              width: 20.w,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 4),
                        child: SizedBox(
                          height: 2.h,
                          width: 30.w,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 12.h,
                              width: 45.w,
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
                              height: 12.h,
                              width: 45.w,
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
                      ),
                    ],
                  )),
      ),
    );
  }
}
