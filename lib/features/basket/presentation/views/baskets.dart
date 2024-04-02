import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/custom_button.dart';
import 'package:food_delivery/const/app_color_const.dart';
import 'package:food_delivery/const/app_const.dart';
import 'package:food_delivery/const/app_images_const.dart';
import 'package:food_delivery/utils/bottom_bar/bottom_bar.dart';
import 'package:food_delivery/utils/nav_states/nav_notifier.dart';
import 'package:food_delivery/utils/navigation/custom_nav.dart';
import 'package:food_delivery/utils/products_container/basket_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class Baskets extends ConsumerStatefulWidget {
  const Baskets({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BasketsState();
}

class _BasketsState extends ConsumerState<Baskets> {
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text('Basket(0)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      ),
      body: SingleChildScrollView(
          child: isLoaded
              ? Column(
                  children: [
                    BasketContainer(),
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                        child: Column(
                      children: [
                        Container(
                          height: 30.h,
                          width: 50.w,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(AppImagesConst.emptyBasket))),
                        ),
                        Text(AppConst.emptyBasket.tr(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(
                            AppConst.empybasketMsh.tr(),
                            style: TextStyle(
                              color: CupertinoColors.systemGrey,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    )),
                    const SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomAppButton(
                          label: 'Order Now'.tr(),
                          onPressed: () {
                            ref.watch(navProvider.notifier).onIndexChanged(0);
                            pushAndRemoveUntil(
                                context, BottomBar(initialIndex: 0));
                          }),
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
