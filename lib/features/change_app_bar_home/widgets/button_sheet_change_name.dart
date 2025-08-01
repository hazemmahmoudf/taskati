
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/theme/app_colors.dart';

import '../../../core/widgets/button_widget.dart';
class ButtonSheetChangeName extends StatelessWidget {
  final String? Function(String?)? validator;
   ButtonSheetChangeName({super.key, this.validator});
  var validationKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
                width: double.infinity,
      child:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key:validationKey ,
                child: TextFormField(
                  validator: (v){
                    if(v==null||v.isEmpty){
                      return "require name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.mainColor
                      )
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                      )
                    ),
                  ),
                ),
              )
            ),  Padding(
              padding: const EdgeInsets.only(right: 30,left: 30,bottom: 30),
              child: ButtonWidget(title: "upload from Name",
                onTap: (){
                  validationKey.currentState!.validate();
                },
              ),
            ),
          ],
        ),
      ),

    );

  }
}



