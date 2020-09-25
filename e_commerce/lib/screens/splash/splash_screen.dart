import 'package:e_commerce/components/body.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Must call on the starting screen.
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
