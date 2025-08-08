
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String image;
  UserModel(this.name,this.image);
}