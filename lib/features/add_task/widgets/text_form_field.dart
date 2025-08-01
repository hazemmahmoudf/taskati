
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hint;
  final int n;
  final TextInputType? keyboardType;
  final  IconData? icon;
  final bool readOnly;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const TextFormFieldWidget({super.key, required this.hint, required this.n, this.keyboardType, this.icon,  this.readOnly=false, this.onTap, this.validator, this.controller});

  @override
  Widget build(BuildContext context) {
    return
    TextFormField(
      validator:validator
      ,
      controller:controller ,
      onTap: onTap,
      maxLines: n,
    readOnly:readOnly ,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      suffixIcon: Icon(icon),
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
    color: Colors.black54,width: 2.w,
    ),
    borderRadius: BorderRadius.circular(12.r),
    ),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color:Colors.black54,width: 2.w),
    borderRadius: BorderRadius.circular(12.r),
    ),
    hintText: hint,
    hintStyle: TextStyle(fontWeight: FontWeight.w500),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.r),
    )
    ),

    );
  }
}
