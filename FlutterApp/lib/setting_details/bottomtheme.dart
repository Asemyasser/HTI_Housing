import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/setting_details/selected_item.dart';
import 'package:gradproject/setting_details/setting_provider.dart';
import 'package:gradproject/setting_details/unselecteditem.dart';
import 'package:provider/provider.dart';
class LanguageBottomTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.selectARLanguage();
            },
            child: provider.currentLanguage=="ar"
                ? SelectedItem("عربي")
                : UnSelectedItem("عربي"),
          ),
          const SizedBox(height: 20,),
          InkWell(
            onTap: () {
              provider.selectEnLanguage();
            },
            child: provider.currentLanguage=="en"
                ? SelectedItem("English")
                : UnSelectedItem("English"),
          ),
        ],
      ),
    );
  }
}
class ThemeBottomTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.enableDarkTheme();  // Set the theme to dark
            },
            child: provider.themeMode == ThemeMode.dark
                ? SelectedItem(AppLocalizations.of(context)!.dark) // Highlight the dark theme if selected
                : UnSelectedItem(AppLocalizations.of(context)!.dark), // Show unselected style for dark theme
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              provider.enableLightTheme();  // Set the theme to light
            },
            child: provider.themeMode == ThemeMode.light
                ? SelectedItem(AppLocalizations.of(context)!.light) // Highlight the light theme if selected
                : UnSelectedItem(AppLocalizations.of(context)!.light), // Show unselected style for light theme
          ),
        ],
      ),
    );
  }
}
