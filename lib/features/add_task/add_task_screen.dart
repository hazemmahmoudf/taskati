
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/widgets/button_widget.dart';
import 'package:taskati/features/add_task/widgets/select_task_color.dart';
import 'package:taskati/features/add_task/widgets/label_widget.dart';
import 'package:taskati/features/add_task/widgets/text_form_field_with_title.dart';
import 'package:taskati/features/home/home_screen.dart';
import 'package:taskati/features/home/models/task_model.dart';

import '../../core/theme/app_colors.dart';

class AddTaskScreen extends StatefulWidget {
   const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var validationKey=GlobalKey<FormState>();
  String? endTime;
  String? startTime;
  String? date;
  var title=TextEditingController();
  var description=TextEditingController();
  Color? userColor;
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
        child: Form(
          key:validationKey ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              LabelWidget(name: "Title"),
               SizedBox(height: 5.h,),
               TextFormFieldWidget(controller: title,hint: "Enter Title", n: 1,keyboardType: TextInputType.text,validator: (v){
                 if(v==null||v.isEmpty){
                   return "title is required";
                 }
               },) ,
                SizedBox(height: 15.h,),
                LabelWidget(name: "Descriptions"),
                SizedBox(height: 5.h,),
               TextFormFieldWidget(controller: description,hint: "Enter Description", n: 4,keyboardType: TextInputType.text,validator: (v){
                 if(v==null||v==""){
                   return "Description is required";
                 }
               },) ,
                SizedBox(height: 15.h,),
                LabelWidget(name: "Date"),
                SizedBox(height: 5.h,),
               TextFormFieldWidget(hint: date??"${DateTime.now().month.toString().padLeft(2,"0")}/${DateTime.now().day.toString().padLeft(2,"0")}/${DateTime.now().year}", n: 1,icon: Icons.calendar_month_outlined,readOnly: true
                 ,onTap: ()async {
                DateTime? picker= await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2030));
               if(picker!=null){
                 setState(() {
                   date="${picker.month}/${picker.day}/${picker.year}";
                 });
               }
                },) ,
                SizedBox(height: 15.h,),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelWidget(name: "Start Time"),
                          SizedBox(height: 5.h,),
                          TextFormFieldWidget(hint: startTime??"12:00 PM", n: 1,keyboardType: TextInputType.number,icon: Icons.access_alarm,
                            onTap: () {
                              showTimePicker(context: context, initialTime: TimeOfDay.now()).then((v){
                                if(v!=null){
                                  setState(() {
                                    startTime=v.format(context);
                                  });
                                }
                              }  );

                             },

                          readOnly: true,) ,
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: Column(
                        children: [
                          LabelWidget(name: "End Time"),
                          SizedBox(height: 5.h,),
                          TextFormFieldWidget(hint: endTime??"01:00 PM", n: 1,keyboardType: TextInputType.number,icon: Icons.access_alarm,
                          readOnly: true,
                          onTap: ()async {
                           TimeOfDay? picked  =await showTimePicker(context: context, initialTime: TimeOfDay.now());
                           if(picked!=null){
                           setState(() {
                             endTime=picked.format(context);
                           });
                           }
                          },) ,
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15.h,),
                LabelWidget(name: "Color"),
                SizedBox(height: 5.h,),
                CircularsColors(
                  onChange:(v){
                    userColor=v;
                  }
                ),
              ],
          ),
        ),
      ),
    ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
        child: ButtonWidget(title: "Create Task",onTap: (){
         if (validationKey.currentState?.validate()??false){
           TaskModel.tasks.add(TaskModel(
             title: title.text,
             description: description.text,
             startTime: startTime??"12:00 PM",
             endTime: endTime??"01:00 PM",
             status: "Todo",
             taskColor: userColor,
             date:date
           ));
           Navigator.pop(context);
         }


        },),
      ),
    );
  }
}
