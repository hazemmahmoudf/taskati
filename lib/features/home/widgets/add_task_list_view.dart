import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/features/home/models/task_model.dart';

import '../../../core/theme/app_colors.dart';

class AddTaskListView extends StatefulWidget {
  const AddTaskListView({super.key});

  @override
  State<AddTaskListView> createState() => _AddTaskListViewState();
}

class _AddTaskListViewState extends State<AddTaskListView> {
  @override
  Widget build(BuildContext context) {
    if ((TaskModel.tasks.isEmpty)) {
      return Center(
      child:ClipRRect(
        child: Image.asset("assets/images/empty.png",fit: BoxFit.cover,),
      ),
    );
    } else {
      return Expanded(
      child: ListView.separated(itemBuilder: (context,index)=>IntrinsicHeight(
        child: Dismissible(key: UniqueKey(),
          confirmDismiss: (d)async{
          setState(() {
            if (d == DismissDirection.endToStart) {
              TaskModel.tasks[index].status = "complete";
            } else if (d == DismissDirection.startToEnd) {
              TaskModel.tasks.remove(TaskModel.tasks[index]);
            }
          });
          return null;
          },
        background: Container(

          color: Colors.red,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Icon(Icons.delete,color: Colors.white,),
        ),
        secondaryBackground: Container(
          color: Colors.green,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Icon(Icons.check,color: Colors.white,),
        ),
        child: TaskItem(taskModel:TaskModel.tasks[index])),
      ), separatorBuilder:(context,index)=>SizedBox(height: 5.h,) , itemCount:TaskModel.tasks.length),
    );
    }
  }
}

class TaskItem extends StatelessWidget {
  final TaskModel taskModel;
   const TaskItem({super.key, required this.taskModel,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color:(taskModel.taskColor==null)?AppColors.mainColor: taskModel.taskColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(taskModel.title??"",style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Icon(Icons.alarm,color: Colors.white,),
                    SizedBox(width: 5.w,),
                    Text("${taskModel.startTime} - ${taskModel.endTime}",style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.white,

                    ),)
                  ],
                ),
                SizedBox(height: 10.h,),
                Text(taskModel.description??"",style: TextStyle(
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

          RotatedBox(quarterTurns: 3,child: Text(taskModel.status??"",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp
          ),),),



        ],
      ),
    );
  }
}

