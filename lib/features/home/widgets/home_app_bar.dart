import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/Extensions/navigator_push.dart';



import '../../../core/services/local/user_services.dart';
import '../../../core/theme/app_colors.dart';
import '../../profile/profile_screen.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  late final user = UserServices.getUSerData();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, ${user?.name??"-------"}",style: TextStyle(
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
          onTap: ()async{
            await Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
            setState(() {

            });
          },
          child: CircleAvatar(
            radius: 35.r,
         backgroundImage:
              FileImage(File(user?.image??""))


    ),

        )
      ],
    );
  }
}

