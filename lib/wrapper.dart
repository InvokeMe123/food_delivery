
import 'package:flutter/material.dart';
import 'package:food_delivery/app/app.dart';
import 'package:food_delivery/app/splash_screen.dart';
import 'package:food_delivery/utils/bottom_bar/bottom_bar.dart';


class Wrapper extends StatefulWidget {
  final bool loading;
  const Wrapper({super.key, this.loading = true});
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = widget.loading;

    if(_loading) {
      Future.delayed(const Duration(milliseconds: 2600), () {
        setState(() => _loading = false);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return _loading ? SplashScreen() : BottomBar(initialIndex: 0);
  }
}