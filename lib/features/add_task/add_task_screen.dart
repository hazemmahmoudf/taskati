
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/widgets/bottom_widget.dart';
import 'package:taskati/features/add_task/widgets/circular_icon_with_background.dart';
import 'package:taskati/features/add_task/widgets/label_widget.dart';
import 'package:taskati/features/add_task/widgets/text_form_field.dart';

import '../../core/theme/app_colors.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    appBar: AppBar(
      elevation: 0,
        centerTitle: true,
        title: Text("Add Task",style: TextStyle(
      color: AppColors.mainColor,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp
    ),),
        iconTheme:IconThemeData(
        color: AppColors.mainColor,
          size: 30.sp
    ),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            LabelWidget(name: "Title"),
             TextFormFieldWidget(hint: "Enter Title", n: 1,keyboardType: TextInputType.text,) ,
              SizedBox(height: 10.h,),
              LabelWidget(name: "Descriptions"),
             TextFormFieldWidget(hint: "Enter Description", n: 4,keyboardType: TextInputType.text,) ,
              SizedBox(height: 10.h,),
              LabelWidget(name: "Date"),
             TextFormFieldWidget(hint: "dd/mm/yy", n: 1,keyboardType: TextInputType.datetime,icon: Icons.calendar_month_outlined,) ,
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        LabelWidget(name: "Start Time"),
                        TextFormFieldWidget(hint: "09:40 PM", n: 1,keyboardType: TextInputType.number,icon: Icons.access_alarm,) ,
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: Column(
                      children: [
                        LabelWidget(name: "End Time"),
                        TextFormFieldWidget(hint: "01:00 PM", n: 1,keyboardType: TextInputType.number,icon: Icons.access_alarm,) ,
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h,),
              LabelWidget(name: "Color"),
              SizedBox(height: 5.h,),
              CircularsColors(),
            ],
        ),
      ),
    ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
        child: BottomWidget(),
      ),
    );
  }
}
