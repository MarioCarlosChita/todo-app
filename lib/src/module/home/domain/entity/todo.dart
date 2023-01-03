import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:solid_principles/src/module/home/domain/enum/priority.dart';

class Todo {
  final String title;
  final String category;
  bool checkbox = false;
  final PriorityTodo priority;

  Todo(
      {required this.checkbox,
      required this.priority,
      required this.title,
      required this.category});

  Todo copyWith(
      {String? title,
      String? category,
      bool? checkbox,
      PriorityTodo? priority}) {
    return Todo(
        title: title ?? this.title,
        category: category ?? this.category,
        checkbox: checkbox ?? this.checkbox,
        priority: priority ?? this.priority);
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "category": category,
        "priority": priority,
        "checkbox": checkbox
      };

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
        checkbox: map['checkbox'] ?? false,
        priority: getPriorityStatus(value: map['priority']),
        title: map['title'] ?? "",
        category: map['category'] ?? "");
  }
}
