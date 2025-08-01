import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/widgets/button_widget.dart';
import 'package:taskati/features/change_app_bar_home/widgets/circle_avatar_image.dart';

class ButtonSheetTakePhoto extends StatelessWidget {
    final VoidCallback onPressed1;
    final VoidCallback onPressed2;

   const ButtonSheetTakePhoto({super.key, required this.onPressed1, required this.onPressed2,});



    @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:MediaQuery.of(context).size.height/4 ,
        width: double.infinity,
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: ButtonWidget(title: "upload from camera",onTap: onPressed1,

              ),
            ),  Padding(
              padding: const EdgeInsets.only(right: 30,left: 30,bottom: 30),
              child: ButtonWidget(title: "upload from Gallery",onTap: onPressed2,

      ))
          ],
        ),

    );
  }
}
