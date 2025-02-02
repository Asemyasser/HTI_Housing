import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';

class WarningsScreen extends StatelessWidget {

  final String username;

  // استلام اسم المستخدم كمعامل
  WarningsScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(backgroundColor:
    provider.isDark()?MyTheme.darkTheme.scaffoldBackgroundColor:MyTheme.lightTheme.scaffoldBackgroundColor
      ,appBar: AppBar(
        backgroundColor:MyTheme.kohli,
        title: Center(child: Text( AppLocalizations.of(context)!.myWarningsTitle,style: provider.isDark()
            ? MyTheme.darkTheme.textTheme.titleLarge
            : MyTheme.lightTheme.textTheme.titleLarge,)),

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // استخدام RichText لتنسيق النص
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:  AppLocalizations.of(context)!.noteLabel, // كلمة Note باللون الوردي
                    style: TextStyle(
                        color:MyTheme.pinkColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 22
                    ),
                  ),
                  TextSpan(
                      text:  AppLocalizations.of(context)!.minimumWarningsText, // باقي النص باللون الأسود
                      style:provider.isDark()?MyTheme.darkTheme.textTheme.bodyLarge:MyTheme.lightTheme.textTheme.bodyLarge
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  WarningCard(username: username, warningMessage:  AppLocalizations.of(context)!.lateWarningMessage1),
                  WarningCard(username: username, warningMessage: AppLocalizations.of(context)!.lateWarningMessage2),
                  // يمكنك إضافة المزيد من التحذيرات هنا
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// مكون لعرض بطاقة التحذير
class WarningCard extends StatelessWidget {
  final String username;
  final String warningMessage;

  WarningCard({required this.username, required this.warningMessage});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
            padding: EdgeInsets.all(16.0), // إضافة بعض الحواف الداخلية
            decoration: BoxDecoration(color: provider.isDark()?MyTheme.kohli:Colors.white,
              border: Border.all(
                color:MyTheme.pinkColor, // لون الحدود وردي (بينك)
                width: 1.5, // عرض الحدود
              ),
              borderRadius: BorderRadius.circular(8.0), // لتدوير الحدود قليلاً
            ),
            child: ListTile(
              title: Text(
                  '$username, $warningMessage',
                  style:provider.isDark()?MyTheme.darkTheme.textTheme.bodyMedium:MyTheme.lightTheme.textTheme.bodyMedium
              ),
              trailing:SvgPicture.asset("assets/image/slideMenue/sad.svg"),
            ),
            ),
        );
    }
}