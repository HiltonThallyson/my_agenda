import 'package:flutter/material.dart';

class Task {
  String id;
  String name;
  String description;
  DateTime day;
  TimeOfDay start;
  TimeOfDay end;
  bool isDaily;

  Task(
      {required this.id,
      required this.name,
      required this.description,
      required this.day,
      required this.start,
      required this.end,
      required this.isDaily});
}
