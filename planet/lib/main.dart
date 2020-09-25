import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planet/ui/home/HomePage.dart';

void main() {
//  Routes.initRoutes();
  runApp(
    MaterialApp(
      title: "Planets",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
  );
}