import 'package:bloc_app/common/values/color.dart';
import 'package:bloc_app/pages/home/bloc/home_page_bloc.dart';
import 'package:bloc_app/pages/home/bloc/home_page_events.dart';
import 'package:bloc_app/pages/home/bloc/home_page_state.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppbar(){

  return AppBar(
    
    title: Container(
      margin: const EdgeInsets.only(left: 7, right: 7, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15,
            height: 12,
            child: Image.asset("assets/icons/menu.png")
          ),
          GestureDetector(
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/person.png")
                )
              ),
            ),
          )
        ],
      ),
    ),
  );
}


Widget HomePageText(String text, Color color, int top){
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold
      )
    )
  );
}

Widget searchView(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 270.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(color: AppColors.primaryFourElementText)
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.h,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 220.w,
              height: 40.h,
              child: TextField(
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: "sreach your course",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              hintStyle: TextStyle(
                color: AppColors.primarySecondaryElementText
              ),
              
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
            autocorrect: false,
            obscureText: false,
          ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(13.h),
            border: Border.all(color: AppColors.primaryElement)
          ),
          child: Image.asset("assets/icons/options.png")
        ),
      )
    ],
  );
}

Widget slidersView(BuildContext context, HomePageState state){
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBloc>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer("assets/icons/Art.png"),
            _slidersContainer("assets/icons/Image(1).png"),
            _slidersContainer("assets/icons/Image(2).png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(8.0),
            activeSize: const Size(17,8,),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            )
          ),
        ),
      )
    ],
  );
}

Widget _slidersContainer(String path){
  return Container(
    margin: EdgeInsets.only( left: 7.w, right: 7.w),
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.h),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      )
    ),
  );
}

Widget menuView(){
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _reusbaleSubTitleText("Chooses your course",color:AppColors.primaryText),
            GestureDetector(
              child: _reusbaleSubTitleText("See all",color: AppColors.primaryThreeElementText)
              )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          children: [
            _reusbaleMenuText("All"),
            _reusbaleMenuText("Popular", textColor: AppColors.primaryThreeElementText, backgroundColor: Colors.white),
            _reusbaleMenuText("Newest", textColor: AppColors.primaryThreeElementText, backgroundColor: Colors.white),
          ],
        ),
      ),
    ],
  );
}

Widget _reusbaleSubTitleText(String text, {Color color = AppColors.primaryText, FontWeight fontWeight = FontWeight.bold, double fontsize = 16}){
  return Container(
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight, 
        fontSize: fontsize..sp
      ),
    ),
  );
}

Widget _reusbaleMenuText(String text, {Color textColor = AppColors.primaryElementText, Color backgroundColor = AppColors.primaryElement}){
  return Container(
    margin: EdgeInsets.only(right: 15.w),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(7.h),
      border: Border.all(color: backgroundColor)
    ),
    child: _reusbaleSubTitleText(
      text, 
      color: textColor, 
      fontWeight: FontWeight.normal, 
      fontsize: 11
      ),
  );
}

Widget courseGrid(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Bast Course for IT and Engineering",
        maxLines: 1,
        overflow: TextOverflow.fade,
        textAlign: TextAlign.left,
        softWrap: false,
        style: TextStyle(
          color: AppColors.primaryElementText,
          fontWeight: FontWeight.bold,
          fontSize: 11.sp
        )
      ),
      SizedBox(
        height: 5.h,
      ),
      Text(
        "Flutter best course",
        maxLines: 1,
        overflow: TextOverflow.fade,
        textAlign: TextAlign.left,
        softWrap: false,
        style: TextStyle(
          color: AppColors.primaryFourElementText,
          fontWeight: FontWeight.normal,
          fontSize: 8.sp
        )
      ),
      SizedBox(
        height: 10.h,
      )
    ],
  );
}


