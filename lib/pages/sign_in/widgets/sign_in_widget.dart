import 'package:bloc_app/common/values/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(String type){
  return AppBar(
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child:  Container(
        color: AppColors.primarySecondaryBackground,
        height: 1,
      )
      ),
    title: Text(
      type,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 16.sp,
        color: AppColors.primaryText
      ),
    ),
  );
}
Widget buildThirdPartyLogin(BuildContext context){
  return Center(
    child: Container(
      margin: EdgeInsets.only(left: 70.w,right: 70.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusebleIcon('google.png'),
          _reusebleIcon("apple.png"),
          _reusebleIcon("facebook.png")
        ],
      )
    ),
  );
}
Widget _reusebleIcon(String icon){
  return GestureDetector(
    onTap: () {
      
    },
    child: Container(
      margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
      width: 40.w,
      height: 40.h,
      child: Image.asset("assets/icons/${icon}")
    ),
  );
}
Widget reusebleText(String text){
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.grey.withOpacity(0.5),
        fontSize: 14.sp,
      ),
    ),
  );
}  
Widget buildTextFild(String text, String textType,String icon, void Function(String values)? func){
  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(color: AppColors.primaryFourElementText)
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          margin: EdgeInsets.only(left: 16.w),
          child: Image.asset("assets/icons/$icon.png"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) {
              func!(value);
            },
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: text,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              hintStyle: const TextStyle(
                color: AppColors.primarySecondaryElementText
              ),
              
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
            autocorrect: false,
            obscureText: textType == "password"? true: false,
          ),
        )
      ],
    ),
  );
}
Widget forgotPassword(){
  return Container(
    padding: EdgeInsets.only(left: 5.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {
        
      },
      child: Text(
        "Forgot Password?",
        style: TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          fontSize: 12.sp,
          decorationColor: Colors.blue
        ),
      ),
    ),
  );
}
Widget buildLogInAndRegButtom(String buttomName, String buttomType, void Function() func){
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: EdgeInsets.only(left: 5.w,right: 5.w, top: buttomType == "Log"? 40.h:20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: buttomType == "Log"?AppColors.primaryElement: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
          color: buttomType == "Log"? Colors.transparent: AppColors.primaryText
        )
      ),
      child: Center(
        child: Text(
          buttomName,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16.sp,
            color: buttomType == "Log"?AppColors.primaryBackground: AppColors.primaryText
          ),
        )
      ),
    ),
  );
}