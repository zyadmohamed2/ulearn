import 'package:bloc_app/common/routes/routes.dart';
import 'package:bloc_app/common/service/global.dart';
import 'package:bloc_app/common/values/constant.dart';
import 'package:bloc_app/pages/application/bloc/application_bloc.dart';
import 'package:bloc_app/pages/application/bloc/application_event.dart';
import 'package:bloc_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc/settings_state.dart';
import 'widgets/settings_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return SizedBox(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context, 
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Congirm logout"),
                            content: const Text("Confirm logout"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }, 
                                child: const Text("Cancel")
                                ),
                                TextButton(
                                onPressed: () {
                                  context.read<AppBloc>().add(TriggerAppEvent(0));
                                  Global.storageService.remove(AppConstant.STORAGE_USER_TOKEN_KEY);
                                  Global.storageService.remove(AppConstant.STORAGE_USER_PROFILE_KEY);
                                  Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
                                }, 
                                child: const Text("Confirm")
                                ),
                              ],
                            );
                          },
                        );
                    },
                    child: Container(
                      height: 100.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage("assets/icons/Logout.png")
                        )
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        )
      ),
    );
  }
}