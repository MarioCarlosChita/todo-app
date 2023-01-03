

import 'dart:ui';

import 'package:flutter/material.dart';

class ShipItem extends StatelessWidget {
  final Color color;
  final String message;
  ShipItem({
    required this.color,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container( 
      padding: const EdgeInsets.symmetric(
         horizontal: 10,
         vertical: 5
      ),
      decoration:BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color:color,
          width: 1
        )
      ),
      child: Text(message,style:  TextStyle(
        color: color,
        fontWeight: FontWeight.bold
      ),)
    );
  }
}
