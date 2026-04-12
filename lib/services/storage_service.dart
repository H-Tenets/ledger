import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageService {
  static late SharedPreferences _prefs;

  // 初始化 SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // 存储账单列表
  static Future<void> saveBills(List<dynamic> bills) async {
    await _prefs.setString('bills', json.encode(bills));
  }

  // 获取账单列表
  static List<dynamic> getBills() {
    final billsString = _prefs.getString('bills');
    if (billsString != null) {
      return json.decode(billsString);
    }
    return [];
  }

  // 存储安全设置
  static Future<void> saveSecuritySettings(Map<String, dynamic> settings) async {
    await _prefs.setString('securitySettings', json.encode(settings));
  }

  // 获取安全设置
  static Map<String, dynamic> getSecuritySettings() {
    final settingsString = _prefs.getString('securitySettings');
    if (settingsString != null) {
      return json.decode(settingsString);
    }
    return {
      'biometricEnabled': true,
      'hideBalance': false,
      'pinCodeSet': true,
    };
  }

  // 存储用户信息
  static Future<void> saveUserInfo(Map<String, dynamic> userInfo) async {
    await _prefs.setString('userInfo', json.encode(userInfo));
  }

  // 获取用户信息
  static Map<String, dynamic> getUserInfo() {
    final userInfoString = _prefs.getString('userInfo');
    if (userInfoString != null) {
      return json.decode(userInfoString);
    }
    return {};
  }

  // 清除所有存储数据
  static Future<void> clearAll() async {
    await _prefs.clear();
  }
}