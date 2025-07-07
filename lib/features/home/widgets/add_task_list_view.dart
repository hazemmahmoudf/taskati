import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class AddTaskListView extends StatelessWidget {
  const AddTaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(itemBuilder: (context,index)=>IntrinsicHeight(
        child: Dismissible(key: UniqueKey(),
        child: TaskItem()),
      ), separatorBuilder:(context,index)=>SizedBox(height: 5.h,) , itemCount: 5),
    );
  }
}
class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.mainColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Flutter Task - 1",style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Icon(Icons.alarm,color: Colors.white,),
                    SizedBox(width: 5.w,),
                    Text("02:25 AM - 02:40 AM",style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.white,

                    ),)
                  ],
                ),
                SizedBox(height: 10.h,),
                Text("i will do this task",style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),)
              ],
            ),
          ),
          VerticalDivider(
            thickness: 2,
          ),

          RotatedBox(quarterTurns: 3,child: Text("ToDo",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp
          ),),),



        ],
      ),
    );
  }
}

