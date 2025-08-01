
import 'package:flutter/material.dart';

extension NavigatorPush on BuildContext{
  move(Widget name){
    Navigator.push(this, MaterialPageRoute(builder: (_)=>name));
  }
}
