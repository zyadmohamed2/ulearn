import 'package:bloc_app/common/entities/entities.dart';
import 'package:bloc_app/common/service/global.dart';
import 'package:flutter/material.dart';
class HomeController{
  final BuildContext context;
  UserItem userProfile = Global.storageService.getUserProfile() ;
  HomeController(this.context);

  Future<void> init() async {
  }
}