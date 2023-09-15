import 'package:bloc_app/common/service/global.dart';
import 'package:bloc_app/common/values/constant.dart';
import 'package:bloc_app/common/widgets/flutter_toast.dart';
import 'package:bloc_app/pages/sign_in/bloc/sgnin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignInController{
  final BuildContext context;
  const SignInController({required this.context});
  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        
        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need fill email adderss");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need fill password");
          return;
        }
        try {
            final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "You don't exist");
            return;
          }
          if(!credential.user!.emailVerified){
            toastInfo(msg: "You need to Verify your email account");
            return;
          }
          var user = credential.user;
          if (user != null) {
            print("user is exist");
            Global.storageService.setString(AppConstant.STORAGE_USER_TOKEN_KEY, "12345678");
            Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
          }
          else{
            toastInfo(msg: "Currently you are not a user of this app ");
            return;
          }
        }on FirebaseException catch (e){
          // print(e.code);
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
        }
      }
    } catch (e) {
      
    }
  }
}
