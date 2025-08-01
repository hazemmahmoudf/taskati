import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import 'button_sheet_change_name.dart';

class EditNameUser extends StatefulWidget {
  const EditNameUser({super.key});

  @override
  State<EditNameUser> createState() => _EditNameUserState();
}

class _EditNameUserState extends State<EditNameUser> {
  String userName = "hazem mahmoud";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            userName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
              color: AppColors.mainColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            final newName = await showModalBottomSheet<String>(
              context: context,
              isScrollControlled: true,
              builder: (context) => ButtonSheetChangeName(),
            );

            if (newName != null && newName.trim().isNotEmpty) {
              setState(() {
                userName = newName;
              });
            }
          },
          child: Container(
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.mainColor, width: 1.5.w),
            ),
            child: Icon(
              Icons.edit_outlined,
              size: 25,
              color: AppColors.mainColor,
            ),
          ),
        )
      ],
    );
  }
}
