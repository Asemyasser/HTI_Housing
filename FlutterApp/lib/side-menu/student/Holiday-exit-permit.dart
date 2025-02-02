import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';
import 'complete-data.dart';

class Holidayexitpermit extends StatelessWidget {
  const Holidayexitpermit({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(
        backgroundColor: provider.isDark()
            ? MyTheme.darkTheme.scaffoldBackgroundColor
            : MyTheme.lightTheme.scaffoldBackgroundColor, // Base background color
        appBar: AppBar(
          backgroundColor: MyTheme.kohli,
          title: Center(
              child: Text(
                AppLocalizations.of(context)!.allow,
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.titleLarge
                    : MyTheme.lightTheme.textTheme.titleLarge,
              )),
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
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      AppLocalizations.of(context)!.delay1,
                      style: provider.isDark()
                          ? MyTheme.darkTheme.textTheme.bodyLarge
                          : MyTheme.lightTheme.textTheme.bodyLarge,
                    ),
                  ),
                  // Background color change depending on theme
                  Container(
                    color: provider.isDark() ? MyTheme.kohli:Colors.white, // Here 'uploadColor' is used for light theme
                    child: CompleteData(
                      buttonstyle:provider.isDark()
                          ? MyTheme.lightTheme.textTheme.titleSmall!
                          : MyTheme.darkTheme.textTheme.titleSmall!,
                      textStyle: provider.isDark()
                          ? MyTheme.darkTheme.textTheme.titleSmall!
                          : MyTheme.lightTheme.textTheme.titleSmall!,
                      boredrColor2: provider.isDark() ? MyTheme.romady : MyTheme.kohli,
                      buttonColor: provider.isDark() ? MyTheme.romady : MyTheme.kohli,
                      buttonText2: AppLocalizations.of(context)!.upload,
                      buttontext: AppLocalizations.of(context)!.submit,
                      buttonColor2: provider.isDark() ? MyTheme.kohli : Colors.white, // Adjust based on theme
                    ),
                  ),
                ],
              ),
            ),
            ),
        );
    }
}