

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:taskati/core/theme/app_colors.dart';
import 'package:taskati/features/change_app_bar_home/widgets/circle_avatar_image.dart';
import 'package:taskati/features/change_app_bar_home/widgets/edit_name_user.dart';

class ChangeDataInAppBarHome extends StatelessWidget {
  const ChangeDataInAppBarHome({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.mainColor
        ),
        actions: [Icon(Icons.sunny),SizedBox(width: 10.w,)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatarImage(),
          SizedBox(height: 10.h,),
          Divider(
            thickness: 2.r,
            indent: 30.w,
            endIndent: 30.w,
            color: AppColors.mainColor,
          ),
          SizedBox(height: 10.h,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: SizedBox(
            child: EditNameUser(),
          ),
        )
        ],
      ),
    );
  }
}
