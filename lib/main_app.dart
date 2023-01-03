import 'package:flutter/material.dart';
// import 'package:solid_principles/src/bootstrap.dart';
import 'package:solid_principles/src/module/home/presenter/pages/home_page/home_page.dart';

Future mainApp() async {
  return runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
