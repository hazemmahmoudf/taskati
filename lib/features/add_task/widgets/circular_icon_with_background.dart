import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CircularsColors extends StatelessWidget {
  const CircularsColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularIconWithBackground(isActive: true,color:Colors.lightBlue ,),
        SizedBox(width: 5.w,),
        CircularIconWithBackground(color: Colors.orange,),
        SizedBox(width: 5.w,),
        CircularIconWithBackground(color: Colors.red,),
      ],
    );
  }
}

class CircularIconWithBackground extends StatelessWidget {
 final bool isActive;
 final Color color;
  const CircularIconWithBackground({super.key,this.isActive=false, required this.color});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20.r,
      backgroundColor:color ,
      child: (isActive)?(Icon(Icons.check,size: 35.sp,color: Colors.white,)):null,
    );
  }
}
