
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(backgroundColor: provider.isDark()?MyTheme.darkTheme.scaffoldBackgroundColor:MyTheme.lightTheme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: MyTheme.kohli,
          title: Center(child: Text(AppLocalizations.of(context)!.about,style: provider.isDark()
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

        body: SingleChildScrollView(
          child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 184,
                  color:MyTheme.kohli,
                  child: Image.asset(
                    "assets/image/grad.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(AppLocalizations.of(context)!.aboutContain,style: provider.isDark()?MyTheme.darkTheme.textTheme.bodyMedium:MyTheme.lightTheme.textTheme.bodyMedium),)
              ],
              ),
        ),
        );
    }
}