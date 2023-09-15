import 'package:bloc_app/common/widgets/flutter_toast.dart';
import 'package:bloc_app/pages/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController{
  final BuildContext context;
  const RegisterController({required this.context});
  
  
  Future<void> handleEmailRegister() async {
    final state =  context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String repassword = state.repassword;
    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can not be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty");
      return;
    } 
    if (repassword != password) {
      toastInfo(msg: "Youre password confirmation is wrong");
      return;
    }
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password,
        );
        if (credential.user != null) {
          await credential.user?.sendEmailVerification();
          await credential.user?.updateDisplayName(userName);
          toastInfo(msg: "An email has been sent to your registered email. To activate it please check your email box and clik on the link");
          Navigator.of(context).pop();
        }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if(e.code == "network-request-failed"){
            toastInfo(msg: "تاكد من الاتصال با الانترنت");
          }
          else if(e.code == "user-not-found"){
            toastInfo(msg: "No user found for the email");
            return;
          }
          else if(e.code == "wrong-password"){
            toastInfo(msg: "Wrong password provided for the user");
            return;
          }
          else if(e.code  == "invalid-email"){
            toastInfo(msg: "invalid email");
            return;
          }
          else if(e.code == "unknown"){
            toastInfo(msg: "unknown");
            return;
          }
          else if(e.code == "email-already-in-use"){
            toastInfo(msg: "Email already in use");
          }
    }
  }
}