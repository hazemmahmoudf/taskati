

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:taskati/features/change_app_bar_home/widgets/button_sheet_take_photo.dart';
class CircleAvatarImage extends StatefulWidget {

   const CircleAvatarImage({super.key });

  @override
  State<CircleAvatarImage> createState() => _CircleAvatarImageState();
}

class _CircleAvatarImageState extends State<CircleAvatarImage> {

  ImagePicker imagePicker=ImagePicker();
  File ? selectedImage;
  Future<void> imageSelector(ImageSource s)async{
    XFile? image=await imagePicker.pickImage(source: s);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {


    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 100.r,
          backgroundImage:  selectedImage != null
              ? FileImage(selectedImage!)
              : const AssetImage('assets/images/default_avatar.png') as ImageProvider,

        ),
        InkWell(
            onTap:(){
              showModalBottomSheet(context: context, builder: (context)=>ButtonSheetTakePhoto(onPressed1: (){
                Navigator.pop(context);
                imageSelector(ImageSource.camera);
              }, onPressed2: () {
                Navigator.pop(context);
                imageSelector(ImageSource.gallery);
              },));
            },
            child: Icon(Icons.camera_alt_rounded,color: Colors.blue,size: 30.sp,))
      ],
    );
  }
}


