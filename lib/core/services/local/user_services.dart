

import 'package:hive/hive.dart';
import 'package:taskati/core/uitls/const_model.dart';
import 'package:taskati/features/profile/models/user_model.dart';

class UserServices{

  static var userBox=Hive.box<UserModel>(ConstModel.edit);

  static saveUser(UserModel user){
    userBox.put("user", user);
  }


  static UserModel? getUSerData(){
    final user = userBox.get("user");
    // return  userBox.get("user") as UserModel;
    return user;
  }





}