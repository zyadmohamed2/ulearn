import 'package:bloc_app/pages/register/bloc/register_event.dart';
import 'package:bloc_app/pages/register/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<userNameEvent>(_userName);
    on<emailEvends>(_email);
    on<passwordEvends>(_password);
    on<repasswordEvent>(_rePassword);
  }
  void _userName(userNameEvent event, Emitter emit){
    print("username: ${event.userName}");
    emit(state.copyWith(userName: event.userName));
  }
  void _email(emailEvends event, Emitter emit){
    print("email: ${state.email}");
    emit(state.copyWith(email: event.email));
  }
  void _password(passwordEvends event, Emitter emit){
    print("password: ${event.password}");
    emit(state.copyWith(password: event.password));
  }
  void _rePassword(repasswordEvent event, Emitter emit){
    print("re-password: ${event.repassword}");
    emit(state.copyWith(repassword: event.repassword));
  }
}