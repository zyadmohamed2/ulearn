import 'package:bloc_app/common/values/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppbar(){
  return AppBar(
    title: Container(
      child: Container(
        child: Text(
          "Settings",
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp
          ),
        ),
      ),
    ),
  ); 
}