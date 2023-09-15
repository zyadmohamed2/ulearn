import 'package:bloc_app/common/routes/names.dart';
import 'package:bloc_app/common/service/global.dart';
import 'package:bloc_app/pages/application/application_pages.dart';
import 'package:bloc_app/pages/application/bloc/application_bloc.dart';
import 'package:bloc_app/pages/home/bloc/home_page_bloc.dart';
import 'package:bloc_app/pages/home/home_page.dart';
import 'package:bloc_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:bloc_app/pages/profile/settings/settings_page.dart';
import 'package:bloc_app/pages/register/bloc/register_bloc.dart';
import 'package:bloc_app/pages/register/register.dart';
import 'package:bloc_app/pages/sign_in/bloc/sgnin_bloc.dart';
import 'package:bloc_app/pages/sign_in/sign_in.dart';
import 'package:bloc_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:bloc_app/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPage{
  static List<PageEntity> routes(){
    return [
    PageEntity(
      route: AppRoutes.INITIAL, 
      page: const Welcome(), 
      bloc: BlocProvider(create: (context) => WelcomeBloc(),)
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN, 
        page: const SignIn(), 
        bloc: BlocProvider(create: (context) => SignInBloc(),)
      ),
      PageEntity(
        route: AppRoutes.REGISTER, 
        page: const Register(), 
        bloc: BlocProvider(create: (context) => RegisterBloc(),)
      ),
      PageEntity(
        route: AppRoutes.APPLICATION, 
        page: const ApplicationPage(), 
        bloc: BlocProvider(create: (context) => AppBloc(),)
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE, 
        page: const HomePage(), 
        bloc: BlocProvider(create: (context) => HomePageBloc(),)
      ),
      PageEntity(
        route: AppRoutes.SETTINGS, 
        page: const SettingsPage(), 
        bloc: BlocProvider(create: (context) => SettingsBloc(),)
      ),
  ];
  }
  static List<dynamic> allBlocProviders(BuildContext context){
    List<dynamic> blocProviders = <dynamic>[];
    for(var bloc in routes()){
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }
  static MaterialPageRoute GenrateRouteSettings(RouteSettings settings){
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool DeviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if(result.first.route == AppRoutes.INITIAL&&DeviceFirstOpen){
          bool isLogged = Global.storageService.getIsLoggedIn();
          if (isLogged) {
            return MaterialPageRoute(builder: (context) => ApplicationPage(),);
          }
          return MaterialPageRoute(builder: (context) => SignIn(), settings: settings);
        }
        return MaterialPageRoute(builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(builder: (_) => const SignIn(), settings: settings);
  }
}
class PageEntity{
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({required this.route, required this.page, this.bloc});
}