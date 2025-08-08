import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/uitls/const_model.dart';
import 'package:taskati/features/home/models/task_model.dart';
import 'package:taskati/features/profile/models/user_model.dart';
import 'package:taskati/taskati_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async{
 WidgetsFlutterBinding.ensureInitialized();

 await SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp, // الوضع الطولي بس
 ]);
  await Hive.initFlutter();
 Hive.registerAdapter(UserModelAdapter());
 Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(ConstModel.tasks);
  await Hive.openBox<UserModel>(ConstModel.edit);
  runApp(TaskatiApp());
}