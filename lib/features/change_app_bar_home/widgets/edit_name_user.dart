import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/features/change_app_bar_home/models/edit_model.dart';
import 'package:taskati/features/change_app_bar_home/widgets/button_sheet_change_name.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/button_widget.dart';

class EditNameUser extends StatefulWidget {
  const EditNameUser({super.key});

  @override
  State<EditNameUser> createState() => _EditNameUserState();
}
 var username=TextEditingController();
class _EditNameUserState extends State<EditNameUser> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(username.text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24.sp
                ,color: AppColors.mainColor
            ),),
        ),
         GestureDetector(
             onTap: () {
               showModalBottomSheet(
                 context: context,
                 isScrollControlled: true,
                 builder: (context) => IntrinsicHeight(
                   child: Padding(
                     padding: EdgeInsets.only(
                       bottom: MediaQuery.of(context).viewInsets.bottom,

                     ),
                     child: Container(
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(20.r),
                           topRight: Radius.circular(20.r),
                         ),
                       ),
                       child: Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Padding(
                               padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                               child: TextFormField(
                                 controller: username,
                                 validator: (v){
                                   if(v==null||v.isEmpty||v.length>6){
                                     return"invalid name";
                                   }
                                   return null;
                   
                                 },
                                 decoration: InputDecoration(
                                   hintText: "Enter your name",
                                    border: OutlineInputBorder(
                   
                                    )
                   
                                 ),
                               ),
                             ),
                           ),
                           Padding(
                             padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                             child: ButtonWidget(title: 'update name',
                              onTap: (){
                              if(username.text.trim().length <= 3){

                              }
                              else {
                                Navigator.pop(context);
                                EditModel.name=username.text;
                                setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:AppColors.mainColor,content: Text("the operation was successful",style:
                                  TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),)));
                              }
                              },
                             ),)

                         ],
                       ),
                     ),
                   ),
                 ),
               );
             },

             child: Container(
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              // color: AppColors.mainColor
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.mainColor,width: 1.5.w)

            ),
            child: Icon(Icons.edit_outlined,size: 25,color: AppColors.mainColor,)
    ))

      ],
    );
  }
}
