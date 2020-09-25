import 'package:flutter/material.dart';
import 'Routes.dart';
import 'ui/HomePage.dart';

void main() {
  Routes.initRoutes();
  runApp(new MaterialApp(
    title: "Planets",
    home: new HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}