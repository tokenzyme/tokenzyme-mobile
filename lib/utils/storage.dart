import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String themeKey = 'theme';
const String slippageKey = 'slippage';
const String tokenKey = 'token';

FlutterSecureStorage storage = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));

Future<ThemeMode> getTheme() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return ThemeMode.values.firstWhere(
    (ThemeMode mode) => mode.name == preferences.getString(themeKey),
    orElse: () => ThemeMode.system,
  );
}

Future<void> saveTheme(ThemeMode themeMode) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString(themeKey, themeMode.name);
}

Future<double> getSlippage() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getDouble(slippageKey) ?? 2;
}

Future<void> saveSlippage(double slippage) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setDouble(slippageKey, slippage);
}

Future<String?> getToken() => storage.read(key: tokenKey);

Future<void> saveToken(String token) => storage.write(key: tokenKey, value: token);

Future<void> removeToken() => storage.delete(key: tokenKey);
