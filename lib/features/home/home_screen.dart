import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/services/local/tasks_services.dart';
import 'package:taskati/core/services/local/user_services.dart';
import 'package:taskati/features/home/widgets/add_task_list_view.dart';
import 'package:taskati/features/home/widgets/date_add_task_row.dart';
import 'package:taskati/features/home/widgets/home_app_bar.dart';
import 'package:taskati/features/home/widgets/task_filter_date.dart';

import '../add_task/add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState(){
    super.initState();
    UserServices.getUSerData();
    TasksServices.getAllTasks();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
            HomeAppBar(),
            SizedBox(
              height: 20.h,
            ),
            DateAddTaskRow(onTap:  ()async {
             await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen()));
              setState(() {

              });
            },),
            SizedBox(
              height: 20.h,
            ),
            TaskFilterDate(),
              SizedBox(
                height: 20.h,
              ),
              Expanded(child: AddTaskListView()),
            ],
          ),
        ),
      ),
    );
  }
}
