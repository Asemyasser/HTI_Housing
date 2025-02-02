import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../setting_details/setting_provider.dart';

class FemaleRules extends StatelessWidget {
  const FemaleRules({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Scaffold(
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildRuleItem('1', AppLocalizations.of(context)!.f1,context),
          _buildRuleItem('2', AppLocalizations.of(context)!.f2,context),
          _buildRuleItem('3', AppLocalizations.of(context)!.f3,context),
          _buildRuleItem('4', AppLocalizations.of(context)!.f4,context),
          _buildRuleItem('5', AppLocalizations.of(context)!.f5,context),
          _buildRuleItem('6', AppLocalizations.of(context)!.f6,context),
          _buildRuleItem('7', AppLocalizations.of(context)!.f7,context),
          _buildRuleItem('8', AppLocalizations.of(context)!.f8,context),
          _buildRuleItem('9', AppLocalizations.of(context)!.f9,context),
          _buildRuleItem('10', AppLocalizations.of(context)!.f10,context),
          _buildRuleItem('11', AppLocalizations.of(context)!.f11,context),
          _buildRuleItem('12', AppLocalizations.of(context)!.f12,context),
          _buildRuleItem('13', AppLocalizations.of(context)!.f13,context),
          _buildRuleItem('14', AppLocalizations.of(context)!.f14,context),
          _buildRuleItem('15', AppLocalizations.of(context)!.f15,context),
          _buildRuleItem('16', AppLocalizations.of(context)!.f16,context),
          _buildRuleItem('17', AppLocalizations.of(context)!.f17,context),
          _buildRuleItem('18', AppLocalizations.of(context)!.f18,context),
          _buildRuleItem('19', AppLocalizations.of(context)!.f19,context),
          _buildRuleItem('20', AppLocalizations.of(context)!.f20,context),
          _buildRuleItem('21', AppLocalizations.of(context)!.f21,context),
        ],
      ),

    );
  }

  Widget _buildRuleItem(String number, String text, BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color:MyTheme.pinkColor, width: 2.0), // إضافة إطار وردي
        borderRadius: BorderRadius.circular(10.0), // جعل الحواف مستديرة
      ),
      child: Card(
        elevation: 0, // إزالة الظلال لأننا نريد الإطار فقط
        color: provider.isDark()?MyTheme.kohli
            :Colors.white, // الحفاظ على لون الخلفية الأبيض للـ Card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // مطابقة الحواف المستديرة
        ),
        //  margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  '$number-',
                  style: MyTheme.pinkText
              ),
              SizedBox(width: 8),
              Expanded(child: Text(text)),
            ],
          ),
        ),
      ),
    );
  }
}