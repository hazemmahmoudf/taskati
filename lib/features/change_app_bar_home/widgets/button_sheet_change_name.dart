import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/button_widget.dart';

class ButtonSheetChangeName extends StatelessWidget {
  final String? Function(String?)? validator;

  ButtonSheetChangeName({super.key, this.validator});

  final validationKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      // MediaQuery.of(context).viewInsets => علشان يعمل padding لما الكيبورد يفتح
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16.w,
        right: 16.w,
        top: 16.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // علشان ياخد أقل حجم حسب المحتوى
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: validationKey,
                child: TextFormField(
                  controller: nameController,
                  validator: validator ??
                          (v) {
                        if (v == null || v.trim().isEmpty) {
                          return "Name is required";
                        }
                        return null;
                      },
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.mainColor),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.mainColor),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 30, left: 30, bottom: 30),
              child: ButtonWidget(
                title: "Upload Name",
                onTap: () {
                  if (validationKey.currentState!.validate()) {
                    Navigator.pop(context, nameController.text.trim());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
