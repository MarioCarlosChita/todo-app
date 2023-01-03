import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String title;
  const Logo({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title ,style: const TextStyle(
      color:Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.bold
    ),);
  }
}
