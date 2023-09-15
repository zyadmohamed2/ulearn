import 'package:bloc_app/pages/register/bloc/register_bloc.dart';
import 'package:bloc_app/pages/sign_in/bloc/sgnin_bloc.dart';
import 'package:bloc_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders{
  static get allAppBlocProviders => [
    BlocProvider(create: (context) => SignInBloc()),
    BlocProvider(create: (context) => WelcomeBloc()),
    BlocProvider(create: (context) => RegisterBloc(),)
  ];
}