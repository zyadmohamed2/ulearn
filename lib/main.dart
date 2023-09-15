import 'package:bloc_app/common/entities/entities.dart';
import 'package:bloc_app/common/routes/pages.dart';
import 'package:bloc_app/common/service/global.dart';
import 'package:bloc_app/common/values/color.dart';
import 'package:bloc_app/common/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() async {
  await Global.init();
  runApp(const MyApp());
  UserItem user = Global.storageService.getUserProfile();
  print("+++++++++++++++++++++++++");
  print(user.toJson());
  print("+++++++++++++++++++++++++");
  print(UserItem());
  print("+++++++++++++++++++++++++");
  print(AppConstant.STORAGE_USER_PROFILE_KEY);
  print("+++++++++++++++++++++++++");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          ...AppPage.allBlocProviders(context)
        ],
        child: ScreenUtilInit(
          builder: (context, child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    iconTheme: IconThemeData(
                      color: AppColors.primaryText
                    )
                  )
                ),
                title: 'Flutter Demo',
                onGenerateRoute: AppPage.GenrateRouteSettings,
                // home: const ApplicationPage(),
                // routes: {
                //   "/Welcome":(context) => const Welcome(),
                //   "/SingIn":(context) => const SignIn(),
                //   "/register":(context) => const Register(),
                // },
              );
          },
        ),
    );
  }
}