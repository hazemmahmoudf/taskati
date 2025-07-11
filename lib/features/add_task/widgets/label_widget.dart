import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
class LabelWidget extends StatelessWidget {
 final String name;
   const LabelWidget({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return  Text(name,style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600
    ),);
  }
}
