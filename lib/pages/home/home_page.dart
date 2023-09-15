import 'package:bloc_app/common/values/color.dart';
import 'package:bloc_app/pages/home/bloc/home_page_bloc.dart';
import 'package:bloc_app/pages/home/bloc/home_page_state.dart';
import 'package:bloc_app/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      backgroundColor: Colors.white,
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: HomePageText("Hello,", AppColors.primaryThreeElementText, 20)
                ),
                SliverToBoxAdapter(
                  child: HomePageText("dbestech", AppColors.primaryText, 5),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 20.h),
                ),
                SliverToBoxAdapter(
                  child: searchView(),
                ),
                SliverToBoxAdapter(
                  child: slidersView(context, state),
                ),
                SliverToBoxAdapter(
                  child: menuView(),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 4,
                      (BuildContext context, int index){
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15.w),
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/icons/Image(2).png")
                            )
                          ), 
                          child: courseGrid()
                        );
                      }
                    ), 
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15,childAspectRatio: 1.6)
                    ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
