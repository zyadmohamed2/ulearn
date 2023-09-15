import 'package:bloc_app/pages/sign_in/bloc/sgnin_bloc.dart';
import 'package:bloc_app/pages/sign_in/bloc/signin_events.dart';
import 'package:bloc_app/pages/sign_in/bloc/signin_state.dart';
import 'package:bloc_app/pages/sign_in/sign_in_controller.dart';
import 'package:bloc_app/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              appBar: buildAppBar("Log In"),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                        child: reusebleText(
                            "Or use your email account to login")),
                    Container(
                      padding: EdgeInsets.only(
                        left: 25.w,
                        right: 25.w,
                      ),
                      margin: EdgeInsets.only(top: 36.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusebleText("Email"),
                          buildTextFild(
                              "Enter your email adress", "email", "user",
                              (values) {
                                print("values: ${values}");
                                context.read<SignInBloc>().add(EmailEvent(values));
                              },
                              ),
                          SizedBox(
                            height: 5.h,
                          ),
                          reusebleText("Password"),
                          buildTextFild(
                              "Enter your password", "password", "lock",
                              (values) {
                                print(values);
                                context.read<SignInBloc>().add(PasswordEvent(values));
                              },
                              ),
                          forgotPassword(),
                          buildLogInAndRegButtom("Log In", "Log",() {
                            SignInController(context: context).handleSignIn("email");
                          }),
                          buildLogInAndRegButtom("Register", "Reg",() {
                            Navigator.pushNamed(context, "/register");
                          },)
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
