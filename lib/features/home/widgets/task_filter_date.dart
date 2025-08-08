import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/theme/app_colors.dart';
import 'package:taskati/features/home/models/filter_model.dart';



class TaskFilterDate extends StatefulWidget {

  const TaskFilterDate({super.key});

  @override
  State<TaskFilterDate> createState() => _TaskFilterDateState();
}


class _TaskFilterDateState extends State<TaskFilterDate> {
  int selectIndex = 0;
  List<FilterModel> filterList = [
    FilterModel(day:" ${DateTime.now().day}",
    month: FilterModel.months[DateTime.now().month-1],
    weekDay: FilterModel.dayWeeks [DateTime.now().weekday-1],
      date: "${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}"
    ),  FilterModel(day:" ${DateTime.now().add(Duration(days: -1)).day}",
    month: FilterModel.months[DateTime.now().add(Duration(days: -1)).month-1],
    weekDay: FilterModel.dayWeeks [DateTime.now().add(Duration(days: -1)).weekday-1],
    ),  FilterModel(day:" ${DateTime.now().add(Duration(days: -2)).day}",
    month: FilterModel.months[DateTime.now().add(Duration(days: -2)).month-1],
    weekDay: FilterModel.dayWeeks [DateTime.now().add(Duration(days: -2)).weekday-1],
    ),  FilterModel(day:" ${DateTime.now().add(Duration(days: -3)).day}",
    month: FilterModel.months[DateTime.now().add(Duration(days: -3)).month-1],
    weekDay: FilterModel.dayWeeks [DateTime.now().add(Duration(days: -3)).weekday-1],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      ...List.generate(4,(index)=> DateFilterItem(onTap: (){
        setState(() {
          selectIndex = index;
        });
      },isActive:(index==selectIndex), filterModel: filterList[index],)
      )],
    );
  }
}
class DateFilterItem extends StatelessWidget {
  final bool isActive;
  final void Function()? onTap;
  final FilterModel filterModel;
   const DateFilterItem({super.key, this.isActive=false,  this.onTap, required this.filterModel, });

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
              Text(filterModel.month,style: TextStyle(
                fontSize: 18.sp,
                color:(isActive)?Colors.white:Colors.black,
                  fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 5.h,),
              Text(filterModel.day,style: TextStyle(
                fontSize: 19.sp,
                  color:(isActive)?Colors.white:Colors.black,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 5.h,),
              Text(filterModel.weekDay,style: TextStyle(
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


