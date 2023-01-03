import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:solid_principles/src/core/utils/constants.dart';

enum PriorityTodo { HIGH, LOW, MEDIUM }

Color getPriorityColor(PriorityTodo data) {
  switch (data) {
    case PriorityTodo.HIGH:
      return Colors.red;
    case PriorityTodo.LOW:
      return floatingButtonColor;
    default:
      return Colors.orange;
  }
}

PriorityTodo getPriorityStatus({required String value}) {
  if (value.toLowerCase().trim() == "high") return PriorityTodo.HIGH;
  if (value.toLowerCase().trim() == "low") return PriorityTodo.LOW;
  return PriorityTodo.MEDIUM;
}
