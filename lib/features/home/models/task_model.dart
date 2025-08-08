import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 2)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final String? startTime;
  @HiveField(3)
  final String? endTime;
  @HiveField(4)
  late  String? status;
  @HiveField(5)
  final int taskColor;
  @HiveField(6)
  final String? date;

  TaskModel({ this.title,
     this.description,
     this.startTime,
     this.endTime,
     this.status,
     required this.taskColor,
  this.date});

static  List<TaskModel>tasks=[];
static  List<TaskModel>time=[];




}
