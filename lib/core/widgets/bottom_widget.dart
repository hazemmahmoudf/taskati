import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(12.r)
      ),
      child: Center(child: Text("Create Task",style: TextStyle(color: Colors.white,fontSize: 24.sp,fontWeight: FontWeight.w600),)),
    );
  }
}
