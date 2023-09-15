import 'package:bloc_app/common/values/color.dart';
import 'package:bloc_app/pages/application/application_widgets.dart';
import 'package:bloc_app/pages/application/bloc/application_bloc.dart';
import 'package:bloc_app/pages/application/bloc/application_event.dart';
import 'package:bloc_app/pages/application/bloc/application_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return Scaffold(
            body: buildPage(state.index),
            bottomNavigationBar: Container(
              width: 375.w,
              height: 58.h,
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.h),
                  topRight: Radius.circular(20.h)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1
                  )
                ]
              ),
              child: BottomNavigationBar(
              onTap: (value) {
                context.read<AppBloc>().add(TriggerAppEvent(value));
                print(state.index);
              },
              currentIndex: state.index,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourElementText,
              items: bottomtabs,
            ),
            )
          );
        }
      )
    );
  }
}