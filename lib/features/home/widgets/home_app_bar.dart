import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/Extensions/navigator_push.dart';
import 'package:taskati/features/change_app_bar_home/change_data_in_app_bar_home.dart';

import '../../../core/theme/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, hazem",style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold
            ),),
            Text("Have A Nice Day",style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600
            ),)
          ],
        ),
        GestureDetector(
          onTap: (){
            context.move(ChangeDataInAppBarHome());
          },
          child: CircleAvatar(
            radius: 35.r,
            backgroundImage: Image.asset("assets/images/person.jpg").image,
          ),
        )
      ],
    );
  }
}
