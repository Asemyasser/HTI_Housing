import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../AppTheme.dart';
import '../../../setting_details/setting_provider.dart';
import '../container.dart';
import '../delay_allowance/delay1.dart';
import 'holiday3.dart';
import 'holiday4.dart';

class Holiday2 extends StatelessWidget {
  final String personName;

  // إضافة مُنشئ لاستقبال الاسم
  Holiday2({required this.personName});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Scaffold(
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,
      appBar: _buildAppBar(context, provider),
      body: Column(
        children: [
          _buildHolidayCheckButton(context, provider),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HolidayContainer(
                    personName: personName,
                    routeClass: () => Holiday3(),
                    StringAfterName: "",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, SettingProvider provider) {
    return AppBar(
      backgroundColor: MyTheme.kohli,
      title: Center(
        child: Text(
          AppLocalizations.of(context)!.allow,
          style: provider.isDark()
              ? MyTheme.darkTheme.textTheme.titleLarge
              : MyTheme.lightTheme.textTheme.titleLarge,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            'assets/image/backIcon.svg',
            width: 20.0,
            height: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      leadingWidth: 30,
      centerTitle: true,
    );
  }

  Widget _buildHolidayCheckButton(BuildContext context, SettingProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Holiday4()),
          );
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.red.shade200,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: provider.isDark() ? MyTheme.romady : MyTheme.kohli,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 20),
                child: Text(
                  AppLocalizations.of(context)!.check,
                  style: provider.isDark()
                      ? MyTheme.darkTheme.textTheme.bodyLarge
                      : MyTheme.lightTheme.textTheme.bodyLarge,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildSaveIcon(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaveIcon() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: SvgPicture.asset(
        "assets/image/slideMenue/stash_save-ribbon.svg",
        color: MyTheme.KohliIconColor,
        height: 5,
        width: 5,
      ),
    );
  }
}

class HolidayContainer extends StatelessWidget {
  final String? personName;
  final Widget Function() routeClass;
  final String StringAfterName;

  HolidayContainer({
    required this.routeClass,
    this.personName,
    required this.StringAfterName,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          border: Border.all(
            color: provider.isDark() ? MyTheme.romady : MyTheme.kohli,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.holidaymaker(personName ?? ''),
              style: provider.isDark()
                  ? MyTheme.darkTheme.textTheme.bodyLarge
                  : MyTheme.lightTheme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMoreButton(context, routeClass, provider),
                _buildAcceptSaveButton(context, provider),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoreButton(BuildContext context, Widget Function() routeClass, SettingProvider provider) {
    return Container(
      height: 50,
      width: 110,
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => routeClass()));
        },
        style: TextButton.styleFrom(
          backgroundColor: provider.isDark() ? MyTheme.romady : MyTheme.kohli,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          AppLocalizations.of(context)!.more,
          style:MyTheme.buttonText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  Widget _buildAcceptSaveButton(BuildContext context, SettingProvider provider) {
    return Container(
      height: 50,
      width: 110,
      child: TextButton(
        onPressed: () {
          showGreenSaveDialog(context);
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          AppLocalizations.of(context)!.acceptSave,
          style: MyTheme.buttonText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
