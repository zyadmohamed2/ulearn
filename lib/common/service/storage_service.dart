import 'dart:convert';

import 'package:bloc_app/common/entities/entities.dart';
import 'package:bloc_app/common/values/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
class StorageService{
  late final SharedPreferences _prefs;
  Future<StorageService> init() async{
    _prefs = await SharedPreferences.getInstance();
    return this;
  }
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key,value);
  }
  bool getDeviceFirstOpen(){
    return _prefs.getBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_THIME)??false;
  }
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key,value);
  }
  bool getIsLoggedIn(){
    return _prefs.getString(AppConstant.STORAGE_USER_TOKEN_KEY) == null?false: true;
  }
  remove(String key){
    _prefs.remove(key);
  }
  String getUserToken(){
    return _prefs.getString(AppConstant.STORAGE_USER_TOKEN_KEY)??"";
  }
  UserItem getUserProfile(){
    var profileOffline = _prefs.getString(AppConstant.STORAGE_USER_PROFILE_KEY)??"";
    if (profileOffline.isNotEmpty) {
      return UserItem.fromJson(jsonDecode(profileOffline));
    }
    return UserItem();
  }
}