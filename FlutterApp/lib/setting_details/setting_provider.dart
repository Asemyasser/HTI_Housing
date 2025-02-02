import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  String currentLanguage = "en";
  ThemeMode themeMode = ThemeMode.light;
  changeTheme(ThemeMode newTheme) {
    themeMode = newTheme;
    notifyListeners();
  }

  void selectARLanguage() {
    currentLanguage = "ar";
    notifyListeners();
  }
  bool isRTL(BuildContext context) {
    return Directionality.of(context) == TextDirection.rtl;
  }

  void selectEnLanguage() {
    currentLanguage = "en";
    notifyListeners();
  }

  enableDarkTheme() {
    themeMode = ThemeMode.dark;
    notifyListeners();
  }

  // Enable light theme
  enableLightTheme() {
    themeMode = ThemeMode.light;
    notifyListeners();
  }
  bool isDark(){
if (themeMode==ThemeMode.dark){
  return true;
}else{return false;}
  }
}
