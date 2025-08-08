import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/uitls/const_model.dart';
import 'package:taskati/features/home/models/task_model.dart';



class TasksServices{
  static var tasksBox=Hive.box<TaskModel>(ConstModel.tasks);


  static storeTask(TaskModel task){
    tasksBox.add(task);
  }

  static getAllTasks(){
    TaskModel.tasks=tasksBox.values.toList();
  }

  static deleteTask(int index){
    tasksBox.deleteAt(index);
  }

  static updateTask(TaskModel task,int index){
    task.status="Complete";
    tasksBox.putAt(index, task);
  }
  static List<TaskModel> filterTasksByDate(String date) {
    return tasksBox.values
        .where((task) => task.date == date)
        .toList();
  }
}