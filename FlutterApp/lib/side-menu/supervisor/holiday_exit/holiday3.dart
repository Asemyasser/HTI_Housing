import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../AppTheme.dart';
import '../../../setting_details/setting_provider.dart';
import '../delay_allowance/delay2.dart';

class Holiday3 extends StatelessWidget {
  const Holiday3({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Scaffold(backgroundColor: provider.isDark()
        ? MyTheme.darkTheme.scaffoldBackgroundColor
        : MyTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
      backgroundColor:MyTheme.kohli,
      title: Center(child: Text( AppLocalizations.of(context)!.allow,style:provider.isDark()
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
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [DelayImport()]),
      ),);
  }
}
