import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../setting_details/bottomtheme.dart';
import '../../setting_details/setting_provider.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(backgroundColor: provider.isDark()
        ? MyTheme.darkTheme.scaffoldBackgroundColor
        : MyTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: provider.isDark()
            ? MyTheme.darkTheme.appBarTheme.backgroundColor
            : MyTheme.lightTheme.appBarTheme.backgroundColor,
        title: Center(
          child: Text(
            AppLocalizations.of(context)!.settings,
            style: provider.isDark()
                ? MyTheme.darkTheme.textTheme.titleLarge
                : MyTheme.lightTheme.textTheme.titleLarge,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // مسافة مناسبة من اليمين واليسار
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/image/backIcon.svg',
              width: 24.0, // زيادة الأبعاد لجعل الأيقونة أسهل في النقر
              height: 24.0,
              color: Colors.white,
            ),
          ),
        ),
        leadingWidth: 56.0, // التأكد من أن العرض مناسب للأيقونة
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                textAlign: TextAlign.start,
              ),

              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => LanguageBottomTheme(),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10.0),
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.arabicEnglish
                            ,
                        ),
                      Icon(
                        Icons.arrow_drop_down_sharp,

                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                AppLocalizations.of(context)!.mode,
                textAlign: TextAlign.start,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => ThemeBottomTheme(),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10.0),
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          AppLocalizations.of(context)!.mode,
                      ),
                      Icon(
                        Icons.arrow_drop_down_sharp,

                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
