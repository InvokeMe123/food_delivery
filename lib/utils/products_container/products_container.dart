import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/const/app_color_const.dart';
import 'package:food_delivery/utils/bottom_sheet_products/bottom_sheet_products.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductContainer extends StatefulWidget {
  final String picture;
  final String description;
  final String price;
  const ProductContainer(
      {super.key,
      required this.description,
      required this.picture,
      required this.price});

  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  void showProduct(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ProductsDetailsPopUp(
          image: widget.picture,
          price: widget.price,
          description: widget.description,
        );
      },
    );
  }

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showProduct(context);
      },
      child: Container(
        height: 32.5.h,
        width: 45.8.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColorConst.kbackgroundGrey),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 19.h,
                width: 42.9.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(widget.picture)),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'QAR ${widget.price}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                  width: 42.w,
                  child: Text(
                    widget.description,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        color: CupertinoColors.systemGrey),
                  )),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.all(4),
                  width: 42.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: count == 0
                      ? Center(
                          child: Text(
                          '+Add',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ))
                      : Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    count--;
                                  });
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: CupertinoColors.destructiveRed,
                                ),
                              ),
                              Text(count.toString()),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: CupertinoColors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
