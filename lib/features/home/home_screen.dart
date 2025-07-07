import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/theme/app_colors.dart';
import 'package:taskati/features/home/widgets/add_task_list_view.dart';
import 'package:taskati/features/home/widgets/date_add_task_row.dart';
import 'package:taskati/features/home/widgets/home_app_bar.dart';
import 'package:taskati/features/home/widgets/task_filter_date.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
          child: Column(
            children: [
              HomeAppBar(),
              SizedBox(height: 20.h,),
              DateAddTaskRow(),
              SizedBox(height: 20.h,),
              TaskFilterDate(),
              SizedBox(height: 20.h,),
              AddTaskListView(),
            ],
          ),
        ),
      ),
    );
  }
}
