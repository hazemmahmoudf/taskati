import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/services/local/user_services.dart';
import 'package:taskati/core/theme/app_colors.dart';
import 'package:taskati/features/add_task/widgets/text_form_field_with_title.dart';
import 'package:taskati/features/profile/models/user_model.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? image;

  selectImageFromGallery()async{
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {

    });
  }

  selectImageFromCamera()async{
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.camera);
    setState(() {

    });
  }

  var nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                showModalBottomSheet(context: context, builder: (context){
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 8.w),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              selectImageFromCamera();
                            }
                            ,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(12.r)
                              ),
                              child: Text("Open Camera",style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white
                              ),),
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          InkWell(
                            onTap: (){
                              selectImageFromGallery();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(12.r)
                              ),
                              child: Text("Open Gallery",style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
              child: CircleAvatar(
                radius: 60.r,
                backgroundImage: Image.file(File(image?.path??UserServices.getUSerData()?.image??"")).image,
                child: Align(
                    alignment: Alignment.bottomRight
                    ,child: Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withValues(alpha: .5)
                    ),
                    child: Icon(Icons.image,color: Colors.white,size: 25.r,))),
              ),
            ),
            SizedBox(height: 40.h,),
            Divider(
              color: AppColors.mainColor,
              endIndent: 40,
              indent: 40,

            ),
            SizedBox(height: 40.h,),
            InkWell(
              onTap: (){
                showModalBottomSheet(context: context, builder: (context){
                  return IntrinsicHeight(
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,
                          top: 10.h,left: 10.w,right: 10.w
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                                controller: nameController, hint: 'Enter the name', n: 1,
                                ),
                            SizedBox(height: 10.h,),
                            InkWell(
                              onTap: (){

                                setState(() {

                                });
                                Navigator.pop(context);
                              }
                              ,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(12.r)
                                ),
                                child: Text("Change name",style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white
                                ),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
              },
              child: Row(
                children: [
                  Expanded(child: Text(
                    (nameController.text.isEmpty)?"hazem":nameController.text
                    ,maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold
                    ),
                  )),
                  Container(
                      decoration: BoxDecoration(
                          shape:BoxShape.circle,
                          border: Border.all(color: AppColors.mainColor,width: 2)
                      ),
                      child: Icon(Icons.mode_edit_outline_outlined,color: AppColors.mainColor,size: 35.r,))
                ],
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                UserServices.saveUser(UserModel(nameController.text, image?.path??UserServices.getUSerData()?.image??""));
                Navigator.pop(context);
              }
              ,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(12.r)
                ),
                child: Text("Create user",style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white
                ),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}