import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/models/model_home_screen.dart';
import 'package:taskati/core/theme/app_colors.dart';

class TaskFilterDate extends StatefulWidget {

  const TaskFilterDate({super.key});

  @override
  State<TaskFilterDate> createState() => _TaskFilterDateState();
}


class _TaskFilterDateState extends State<TaskFilterDate> {
  int selectIndex = 0;
  static const List<String> _monthNames = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  ];
  static const List<String> _weekDayNames = [
    "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"
  ];

  List<ModelHomeScreen> list = [];

  @override
  void initState() {
    super.initState();
    list = List.generate(4, (i) {
      final date = DateTime.now().add(Duration(days: i));
      return ModelHomeScreen(
        month: _monthNames[date.month - 1],
        day: "${date.day}",
        weekDay: _weekDayNames[date.weekday%7 ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      ...List.generate(4,(index)=> DateFilterItem(onTap: (){
        setState(() {
          selectIndex = index;
        });
      },isActive:(index==selectIndex),day: list[index].day,month:list[index].month,weekDay: list[index].weekDay,))
      ],
    );
  }
}
class DateFilterItem extends StatelessWidget {
  final bool isActive;
  final String month;
  final String day;
  final String weekDay;
  final void Function()? onTap;

   const DateFilterItem({super.key, this.isActive=false, required this.month, required this.day, required this.weekDay, this.onTap,});

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
              Text(month,style: TextStyle(
                fontSize: 18.sp,
                color:(isActive)?Colors.white:Colors.black,
                  fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 5.h,),
              Text(day,style: TextStyle(
                fontSize: 19.sp,
                  color:(isActive)?Colors.white:Colors.black,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 5.h,),
              Text(weekDay,style: TextStyle(
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


