import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/custom_form.dart';
import 'package:food_delivery/const/app_color_const.dart';
import 'package:food_delivery/const/app_const.dart';
import 'package:food_delivery/const/app_fonts.dart';
import 'package:food_delivery/const/app_images_const.dart';
import 'package:food_delivery/features/dashboard/presentation/views/location/location.dart';
import 'package:food_delivery/features/favourites/presentation/favourites.dart';
import 'package:food_delivery/features/flowers/presentation/views/flowers.dart';
import 'package:food_delivery/features/grocery/presentation/views/grocery.dart';
import 'package:food_delivery/features/health/presentation/views/health.dart';
import 'package:food_delivery/features/market/presentation/views/market.dart';
import 'package:food_delivery/features/restaurant/presentation/view/restaurants.dart';
import 'package:food_delivery/features/the_Stars/presentation/the_stars.dart';
import 'package:food_delivery/utils/bottom_sheet_lang/languageModalSheet.dart';
import 'package:food_delivery/utils/navigation/custom_nav.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  TextEditingController searchController = TextEditingController();
  bool isLoaded = false;
  bool isoffertapped = false;
  bool isfdtapped = false;
  bool isneartapped = false;
  bool isvendtapped = false;
  bool isFilterTapped = false;
  Color color1 = Colors.white;
  Color color2 = Colors.black;
   ScrollController _scrollController = ScrollController();
  double scroll = 0;
  bool showHeaderNav = false;

  Future<void> setTrue() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isLoaded = true;
    });
  }


  _scrollListener() {
    setState(() {
      scroll = _scrollController.offset;
      if(scroll>1058){
        showHeaderNav = true;
      }else{
        showHeaderNav = false;
      }

    });
  }

  @override
  void initState() {

    _scrollController.addListener(_scrollListener);
    setTrue();
    super.initState();
  }

  filter(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8, left: 8, right: 8, top: 3),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isoffertapped = false;
                isvendtapped = false;
                isfdtapped = false;
                isneartapped = false;
                isFilterTapped = !isFilterTapped;
              });
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: isFilterTapped ? color2 : color1,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey, width: .5)),
              child: Icon(
                Icons.tune,
                color: isFilterTapped ? color1 : color2,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isoffertapped = !isoffertapped;
                        isvendtapped = false;
                        isfdtapped = false;
                        isneartapped = false;
                        isFilterTapped = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: isoffertapped ? color2 : color1,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: .5)),
                      child: Row(
                        children: [
                          Text("🔥",style: TextStyle(fontSize: 20),),

                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            AppConst.offer.tr(),
                            style: TextStyle(
                                color: isoffertapped ? color1 : color2,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isoffertapped = false;
                        isvendtapped = false;
                        isfdtapped = !isfdtapped;
                        isneartapped = false;
                        isFilterTapped = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: isfdtapped ? color2 : color1,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: .5)),
                      child: Row(
                        children: [
                          Text("🛵",style: TextStyle(fontSize: 20),),

                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            AppConst.freeDelivery.tr(),
                            style: TextStyle(
                                color: isfdtapped ? color1 : color2,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isoffertapped = false;
                        isvendtapped = false;
                        isfdtapped = false;
                        isneartapped = !isneartapped;
                        isFilterTapped = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: isneartapped ? color2 : color1,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: .5)),
                      child: Row(
                        children: [
                          Text("📍",style: TextStyle(fontSize: 20),),

                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            AppConst.near.tr(),
                            style: TextStyle(
                                color: isneartapped ? color1 : color2,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isoffertapped = false;
                        isvendtapped = !isvendtapped;
                        isfdtapped = false;
                        isneartapped = false;
                        isFilterTapped = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: isvendtapped ? color2 : color1,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: .5)),
                      child: Row(
                        children: [
                          Text("🚗",style: TextStyle(fontSize: 20),),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            AppConst.deliveryByVendor.tr(),
                            style: TextStyle(
                                color: isvendtapped ? color1 : color2,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final locale = ref.read(localeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        toolbarHeight: showHeaderNav ? 167 : 110,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text(
                                AppConst.deliveringTo.tr(),
                                style: TextStyle(
                                    fontFamily: AppFont.kArabic,
                                    color: CupertinoColors.systemGrey,
                                    fontSize: 12),
                              )),
                              GestureDetector(
                                onTap: () {
                                  normalNav(context, Location());
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Ras Laffan',
                                      //textDirection: TextDirection.ltr,
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
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              normalNav(context, Favourite());
                              print('favourites');
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 10, bottom: 8, left: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                              child: const Center(
                                  child: Icon(Icons.favorite_border_outlined)),
                            ),
                          ),
                        )
                      ],
                    ),
                    CustomAppForm(
                        textEditingController: searchController,
                        lable: AppConst.searchSmthgSpecific.tr(),
                        prefixIcon: Icons.search,
                        isPrefixIconrequired: true,
                        readOnly: false),


                  ],
                ),
              ),
              if(showHeaderNav)
                filter(context)
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          controller: _scrollController,
          child: isLoaded
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //restaurant stars section.........
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8),
                          child: GestureDetector(
                            onTap: () {
                              normalNav(context, RestaurantScreen());
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: 12.5.h,
                              width: width * 0.48,
                              decoration: BoxDecoration(
                                  color: AppColorConst.kbackgroundGrey,
                                  borderRadius: BorderRadius.circular(18)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 23.9.w,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 10),
                                      child: Text(
                                        AppConst.restaurants.tr(),
                                        style: const TextStyle(
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 14.h,
                                    width: 20.w,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                AppImagesConst.burger))),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0, right: 8),
                          child: GestureDetector(
                            onTap: () {
                              normalNav(context, TheStars());
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: 12.5.h,
                              width: width * 0.45,
                              decoration: BoxDecoration(
                                  color: AppColorConst.kbackgroundGrey,
                                  borderRadius: BorderRadius.circular(18)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        AppConst.theStars.tr(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color:
                                                AppColorConst.kprimaryPurple),
                                        child: const Text(
                                          '100+',
                                          style: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 0.5),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Container(
                                      height: 20.h,
                                      width: 20.w,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImagesConst.stars))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //market/grocery/health section......
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              normalNav(context, const MarketScreen());
                            },
                            child: SizedBox(
                              width: 22.w,
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    width: width * 0.22,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        color: AppColorConst.kbackgroundGrey),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(AppImagesConst.market),
                                    ),
                                  ),
                                  Text(
                                    AppConst.market.tr(),
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              normalNav(context, const GroceryScreen());
                            },
                            child: SizedBox(
                              width: 22.w,
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    width: width * 0.22,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColorConst.kbackgroundGrey),
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child:
                                          Image.asset(AppImagesConst.grocery),
                                    ),
                                  ),
                                  Text(
                                    AppConst.grocery.tr(),
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              normalNav(context, const HealthScreen());
                            },
                            child: SizedBox(
                              width: 22.w,
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    width: width * 0.22,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        color: AppColorConst.kbackgroundGrey),
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child:
                                          Image.asset(AppImagesConst.medicine),
                                    ),
                                  ),
                                  Text(
                                    AppConst.healthAndWealth.tr(),
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              normalNav(context, const FlowersScrenn());
                            },
                            child: Container(
                              width: 22.w,
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    width: width * 0.27,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        color: AppColorConst.kbackgroundGrey),
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child:
                                          Image.asset(AppImagesConst.bouquet),
                                    ),
                                  ),
                                  Text(
                                    AppConst.flowers.tr(),
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //rafeeq market section....
                    Container(
                      width: width,
                      color: AppColorConst.kbackgroundGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: width,
                          height: 69,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(
                                        0.5), // Adjust opacity for dimming effect
                                    BlendMode.darken,
                                  ),
                                  fit: BoxFit.fill,
                                  image: const AssetImage(
                                      AppImagesConst.rafeeq_market)),
                              color: AppColorConst.kprimaryPurple,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Rafeeq Market',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              GestureDetector(
                                onTap: () {
                                  normalNav(context, GroceryScreen());
                                },
                                child: Container(
                                  width: 145,
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: AppColorConst.kprimaryPurple,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Get Grocery'.tr(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 16,
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
                    //Services Section........
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Services'.tr(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 4, top: 12, bottom: 0),
                                  height: 150,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      color: AppColorConst.kbackgroundGrey,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Unlimited'.tr(),
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'We bring things\ncloser'.tr(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    CupertinoColors.systemGrey),
                                          )
                                        ],
                                      ),
                                      Positioned(
                                        top: 35,
                                        left: 0,
                                        child: Container(
                                          height: 12.h,
                                          width: 37.2.w,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      AppImagesConst.cars))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  height: 150,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      color: AppColorConst.kbackgroundGrey,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 35,
                                        right:
                                            locale.state == Locale('en', 'US')
                                                ? null
                                                : 30,
                                        left: locale.state == Locale('en', 'US')
                                            ? 30
                                            : null,
                                        child: Container(
                                          height: 14.h,
                                          width: 19.2.w,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      AppImagesConst.bag))),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Buy &\nDeliver'.tr(),
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Shopping\nis now\neasy',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    CupertinoColors.systemGrey),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  height: 150,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      color: AppColorConst.kbackgroundGrey,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 35,
                                        right:
                                            locale.state == Locale('en', 'US')
                                                ? null
                                                : 38,
                                        left: locale.state == Locale('en', 'US')
                                            ? 38
                                            : null,
                                        child: Container(
                                          height: 14.h,
                                          width: 18.2.w,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      AppImagesConst
                                                          .delivery))),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Pick &\nDrop'.tr(),
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Send items\ninstantly',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                    CupertinoColors.systemGrey),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //express delivery
                    Container(
                      width: width,
                      color: AppColorConst.kbackgroundGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: width,
                          height: 69,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      AppImagesConst.express_delivery)),
                              color: AppColorConst.kprimaryPurple,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Express Delivery',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              GestureDetector(
                                onTap: () {
                                  normalNav(context, GroceryScreen());
                                },
                                child: Container(
                                  width: 145,
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: AppColorConst.kprimaryPurple,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Get Grocery'.tr(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 16,
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
                    //Brands Section...
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConst.topBrands.tr(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 22.w,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: width * 0.22,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                        child: Image.asset(
    AppImagesConst.brand1,),
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
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                      child: Image.asset(
                                        AppImagesConst.brand2,),
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
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                      child: Image.asset(
                                        AppImagesConst.brand3,),
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
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(18),
                                          color: AppColorConst.kbackgroundGrey),
                                      child: Image.asset(
                                        AppImagesConst.brand4,),
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
                        ],
                      ),
                    ),
                    //trending section..............

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppConst.trending.tr(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 8, right: 8, top: 15),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: CupertinoColors.systemGrey,
                                          width: .2),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 140,
                                              width: 80.w,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                image: AssetImage(
                                                  AppImagesConst
                                                      .discount_rafeeq,
                                                ),
                                              )),
                                            ),
                                            Positioned(
                                                top: 8,
                                                right: 4,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      print('favourites');
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 6,
                                                              right: 6,
                                                              bottom: 4,
                                                              left: 6),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black26),
                                                          color: Colors.black12,
                                                          shape:
                                                              BoxShape.circle),
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
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 5),
                                                          child: const Icon(
                                                            Icons.star_rounded,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    250,
                                                                    226,
                                                                    10),
                                                            size: 17,
                                                          ),
                                                        ),
                                                        const Text(
                                                          '4.1',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                color: CupertinoColors
                                                                    .systemGrey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  width: 70,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
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
                                                        style: TextStyle(
                                                            fontSize: 12),
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
                                  margin: const EdgeInsets.only(
                                      left: 8, right: 8, top: 15),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: CupertinoColors.systemGrey,
                                          width: .2),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 140,
                                              width: 80.w,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                image: AssetImage(
                                                  AppImagesConst
                                                      .discount_rafeeq,
                                                ),
                                              )),
                                            ),
                                            Positioned(
                                                top: 8,
                                                right: 4,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      print('favourites');
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 6,
                                                              right: 6,
                                                              bottom: 4,
                                                              left: 6),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black26),
                                                          color: Colors.black12,
                                                          shape:
                                                              BoxShape.circle),
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
                                          width: 80
                                              .w, // Set your desired width for the container
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
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 5),
                                                          child: const Icon(
                                                            Icons.star_rounded,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    250,
                                                                    226,
                                                                    10),
                                                            size: 17,
                                                          ),
                                                        ),
                                                        const Text(
                                                          '4.1',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                color: CupertinoColors
                                                                    .systemGrey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  width: 70,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
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
                                                        style: TextStyle(
                                                            fontSize: 12),
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
                            ),
                          ),
                        ],
                      ),
                    ),

                    if(!showHeaderNav)
                      SizedBox(height: 10,),

                    //offers discount slider tab
                    if(!showHeaderNav)
                    filter(context),

                    isLoaded
                        ? Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 8, right: 8, top: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CupertinoColors.systemGrey,
                                        width: .2),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 140,
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
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    print('favourites');
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6,
                                                            right: 6,
                                                            bottom: 4,
                                                            left: 6),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black26),
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
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(right: 5),
                                                        child: const Icon(
                                                          Icons.star_rounded,
                                                          color: Color.fromARGB(
                                                              255,
                                                              250,
                                                              226,
                                                              10),
                                                          size: 17,
                                                        ),
                                                      ),
                                                      const Text(
                                                        '4.1',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              color:
                                                                  CupertinoColors
                                                                      .systemGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                width: 70,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                                      style: TextStyle(
                                                          fontSize: 12),
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
                                margin: const EdgeInsets.only(
                                    left: 8, right: 8, top: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CupertinoColors.systemGrey,
                                        width: .2),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 140,
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
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    print('favourites');
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6,
                                                            right: 6,
                                                            bottom: 4,
                                                            left: 6),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black26),
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
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(right: 5),
                                                        child: const Icon(
                                                          Icons.star_rounded,
                                                          color: Color.fromARGB(
                                                              255,
                                                              250,
                                                              226,
                                                              10),
                                                          size: 17,
                                                        ),
                                                      ),
                                                      const Text(
                                                        '4.1',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              color:
                                                                  CupertinoColors
                                                                      .systemGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                width: 70,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                                      style: TextStyle(
                                                          fontSize: 12),
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
                                margin: const EdgeInsets.only(
                                    left: 8, right: 8, top: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CupertinoColors.systemGrey,
                                        width: .2),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 140,
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
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    print('favourites');
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6,
                                                            right: 6,
                                                            bottom: 4,
                                                            left: 6),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black26),
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
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(right: 5),
                                                        child: const Icon(
                                                          Icons.star_rounded,
                                                          color: Color.fromARGB(
                                                              255,
                                                              250,
                                                              226,
                                                              10),
                                                          size: 17,
                                                        ),
                                                      ),
                                                      const Text(
                                                        '4.1',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              color:
                                                                  CupertinoColors
                                                                      .systemGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                width: 70,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                                      style: TextStyle(
                                                          fontSize: 12),
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
                                margin: const EdgeInsets.only(
                                    left: 8, right: 8, top: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CupertinoColors.systemGrey,
                                        width: .2),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 140,
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
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    print('favourites');
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6,
                                                            right: 6,
                                                            bottom: 4,
                                                            left: 6),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black26),
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
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(right: 5),
                                                        child: const Icon(
                                                          Icons.star_rounded,
                                                          color: Color.fromARGB(
                                                              255,
                                                              250,
                                                              226,
                                                              10),
                                                          size: 17,
                                                        ),
                                                      ),
                                                      const Text(
                                                        '4.1',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              color:
                                                                  CupertinoColors
                                                                      .systemGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                width: 70,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                                      style: TextStyle(
                                                          fontSize: 12),
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
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: AppColorConst.kbackgroundGrey),
                                    ),
                                    baseColor: Colors.grey.shade100,
                                    highlightColor: Colors.grey.shade200,
                                  ),
                                ),
                              ],
                            ),
                          )
                  ],
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
    );
  }
}
