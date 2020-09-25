import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    // Must call on the starting screen.
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
