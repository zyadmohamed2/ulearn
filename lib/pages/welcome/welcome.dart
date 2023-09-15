import 'package:bloc_app/common/service/global.dart';
import 'package:bloc_app/common/values/color.dart';
import 'package:bloc_app/common/values/constant.dart';
import 'package:bloc_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:bloc_app/pages/welcome/bloc/welcome_events.dart';
import 'package:bloc_app/pages/welcome/bloc/welcome_state.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  
  @override
  Widget build(BuildContext context) {
    double heigth =  MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h,),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                        1,
                        context,
                        "next",
                        "Fist See Learning",
                        "Forget about a for of paper all knowledge in one learning",
                        "assets/images/reading.png"
                      ),
                      _page(
                        2,
                        context,
                        "next",
                        "Connect With Everyone",
                        "Always keep in touch with your tutor & friend. let's get connected!",
                        "assets/images/boy.png"
                      ),
                      _page(
                        3,
                        context,
                        "next",
                        "Always Fascinated Learning",
                        "Anywhere, anytime. The time is at your discretion so study whenever you want.",
                        "assets/images/man.png"
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: heigth < 650? 20: 40,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThreeElementText,
                        activeColor: AppColors.primaryElement,
                        size: Size.square(8.0),
                        activeSize: Size(18, 8),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ),
    );
  }
  Widget _page(int index, BuildContext context, String buttonName, String title, String subtitle,String image){
    return Column(
      children: [
        SizedBox(
          height: 345.w,
          width: 345.w,
          child: Image.asset(image),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal
            ),
          ),
        ),
        Container(
          width: 335.w,
          padding: EdgeInsets.only(left: 30.w,right: 30.w,top: 15.h),
          child: Text(
            subtitle,
            style: TextStyle(
              color: AppColors.primarySecondaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
            }
            else{
              Global.storageService.setBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_THIME, true);
              print("The value is ${Global.storageService.getDeviceFirstOpen()}");
              Navigator.pushNamedAndRemoveUntil(context, "/SingIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, right: 25.w, left: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(15.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 1)
                )
              ]
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
