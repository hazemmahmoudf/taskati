import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/theme/app_colors.dart';



class TaskFilterDate extends StatefulWidget {

  const TaskFilterDate({super.key});

  @override
  State<TaskFilterDate> createState() => _TaskFilterDateState();
}


class _TaskFilterDateState extends State<TaskFilterDate> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      ...List.generate(4,(index)=> DateFilterItem(onTap: (){
        setState(() {
          selectIndex = index;
        });
      },isActive:(index==selectIndex))
      )],
    );
  }
}
class DateFilterItem extends StatelessWidget {
  final bool isActive;

  final void Function()? onTap;

   const DateFilterItem({super.key, this.isActive=false,  this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
          decoration: BoxDecoration(
            color: (isActive)?AppColors.mainColor:Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              Text("Aug",style: TextStyle(
                fontSize: 18.sp,
                color:(isActive)?Colors.white:Colors.black,
                  fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 5.h,),
              Text("8",style: TextStyle(
                fontSize: 19.sp,
                  color:(isActive)?Colors.white:Colors.black,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 5.h,),
              Text("fri",style: TextStyle(
                fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                color:(isActive)?Colors.white:Colors.black,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}


