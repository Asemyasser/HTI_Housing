import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import '../../../AppTheme.dart';
import '../../../setting_details/setting_provider.dart';
import '../../student/complete-data.dart';
import '../delay_allowance/delay4.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Holiday5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Scaffold(
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,
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
        centerTitle: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CompleteData(
                buttonstyle: MyTheme.buttonText,
                textStyle: provider.isDark()
                    ? MyTheme.lightTheme.textTheme.titleSmall!
                    : MyTheme.darkTheme.textTheme.titleSmall!,
                buttonText2: AppLocalizations.of(context)!.open, // Correct parameter name
                buttonColor: Colors.red, // Correct parameter name
                buttontext: AppLocalizations.of(context)!.unsaved, // Correct parameter name
                buttonColor2: provider.isDark() ? MyTheme.romady : MyTheme.kohli, // Correct parameter name
                navigateToScreen: () => Delay4(),
                boredrColor2:provider.isDark() ?MyTheme.romady:MyTheme.kohli,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // دالة لبناء حقول الإدخال بشكل مرن
  Widget rowbuildInputField(String hint) {
    var provider = Provider.of<SettingProvider>(context as BuildContext);

    return Padding(
        padding: const EdgeInsets.only(right: 10.0), // تعديل المسافات
        child: Container(
            padding: EdgeInsets.all(5),
            height: 51,
            width: 110,
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                hintStyle:provider.isDark()?MyTheme.darkTheme.textTheme.bodyMedium:MyTheme.darkTheme.textTheme.bodyMedium,
                border: OutlineInputBorder(),
              ),
            ),
            ),
        );
    }
}