import 'package:flutter/material.dart';
class TaskModel {

  final String? title;
  final String? description;
  final String? startTime;
  final String? endTime;
  late final String? status;
  final Color? taskColor;
  final String? date;

  TaskModel({ this.title,
     this.description,
     this.startTime,
     this.endTime,
     this.status,
     this.taskColor,
  this.date});

static  List<TaskModel>tasks=[];

}