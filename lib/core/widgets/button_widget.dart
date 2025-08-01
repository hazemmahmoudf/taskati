import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
class ButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  const ButtonWidget({super.key, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(12.r)
        ),
        child: Center(child: Text(title,style: TextStyle(color: Colors.white,fontSize: 24.sp,fontWeight: FontWeight.w600),)),
      ),
    );
  }
}
