import 'package:bloc_app/pages/register/bloc/register_bloc.dart';
import 'package:bloc_app/pages/register/bloc/register_event.dart';
import 'package:bloc_app/pages/register/bloc/register_state.dart';
import 'package:bloc_app/pages/register/register_conttroller.dart';
import 'package:bloc_app/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
                appBar: buildAppBar("Sing up"),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child:
                            reusebleText("Enter your details below and free sign up")
                        ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 25.w,
                          right: 25.w,
                        ),
                        margin: EdgeInsets.only(top: 36.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusebleText("User name"),
                            buildTextFild(
                              "Enter your User name",
                              "email",
                              "user",
                              (values) {
                                context.read<RegisterBloc>().add(userNameEvent(values));
                              },
                            ),
                            reusebleText("Email"),
                            buildTextFild(
                              "Enter your email adress",
                              "email",
                              "user",
                              (values) {
                                context.read<RegisterBloc>().add(emailEvends(values));
                              },
                            ),
                            reusebleText("Password"),
                            buildTextFild(
                              "Enter your password",
                              "password",
                              "lock",
                              (values) {
                                context.read<RegisterBloc>().add(passwordEvends(values));
                              },
                            ),
                            reusebleText("Re-enter password"),
                            buildTextFild(
                              "Re-enter your password to confirm",
                              "password",
                              "lock",
                              (values) {
                                context.read<RegisterBloc>().add(repasswordEvent(values));
                              },
                            ),
                            reusebleText("Enter your details below and free sign up"),
                            buildLogInAndRegButtom(
                              "Sing up",
                              "Log",
                              () {
                                RegisterController(context: context).handleEmailRegister();
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ),
          );
      },
    );
  }
}
