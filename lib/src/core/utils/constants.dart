import 'dart:ui';

import 'package:flutter/scheduler.dart';
import 'package:solid_principles/src/module/home/domain/enum/priority.dart';

import '../../module/home/domain/entity/todo.dart';

Color backgroundAppColor = const Color(0xFFf8fcfc);
Color floatingButtonColor = const Color(0xFF18a0fc);
// #18a0fc

const TODO_LOCAL_NAME = "todo";

const CATEGORY_LIST = [
  "Home",
  "Music",
  "Food",
  "Shop",
  "Sport",
  "Read",
  "School",
  "Dance",
  "Beach"
];

List<Todo> LIST_TODO = [
  Todo(
      checkbox: false,
      priority: PriorityTodo.HIGH,
      title: "Pay for utility Services",
      category: "home"),
  Todo(
      checkbox: false,
      priority: PriorityTodo.MEDIUM,
      title: "Buy groceries for mac & cheese",
      category: "food"),
  Todo(
      checkbox: false,
      priority: PriorityTodo.LOW,
      title: "Practice Piano",
      category: "music"),
];
