import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/uitls/const_model.dart';
import 'package:taskati/features/profile/models/user_model.dart';
import 'package:taskati/taskati_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async{
  await Hive.initFlutter();
 Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(ConstModel.edit);
  runApp(TaskatiApp());
}