import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../setting_details/setting_provider.dart';

class BusTimeMale extends StatelessWidget {
  const BusTimeMale({super.key});

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
          Center(
              child:   ClipRRect(
                child: Image.asset(
                  "assets/image/bus.png",
                  width: 255,
                  height: 200,
                ),
              ),
          ),
          //  SizedBox(height: 20),

          _buildBusCard(
              context,
              AppLocalizations.of(context)!.busLocationAlDafia,
              AppLocalizations.of(context)!.time1,
              AppLocalizations.of(context)!.time2,
              AppLocalizations.of(context)!.time3),
          _buildBusCard(
              context,
              AppLocalizations.of(context)!.busLocationAlNormal,
              AppLocalizations.of(context)!.time4,
              AppLocalizations.of(context)!.time5,
              AppLocalizations.of(context)!.time6),
        ],
      ),
    );
  }

  Widget _buildBusCard(BuildContext context, String location, String arrival1,
      String arrival2, String arrival3) {
    var provider = Provider.of<SettingProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      decoration: BoxDecoration(
        border:
            Border.all(color: MyTheme.pinkColor, width: 2.0), // إضافة إطار وردي
        borderRadius: BorderRadius.circular(10.0), // جعل الحواف مستديرة
      ),
      child: Card(
        elevation: 0, // إزالة الظلال لأننا نريد الإطار فقط
        color: provider.isDark()?MyTheme.kohli:Colors.white, // الحفاظ على لون الخلفية الأبيض للـ Card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // مطابقة الحواف المستديرة
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                location,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Table(
                border: TableBorder.all(color:MyTheme.pinkColor),
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(AppLocalizations.of(context)!.arrivalTimes,
                            textAlign: TextAlign.center,
                            style: provider.isDark()
                                ? MyTheme.darkTheme.textTheme.bodyLarge
                                : MyTheme.lightTheme.textTheme.bodyLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(AppLocalizations.of(context)!.movementTimes,
                            textAlign: TextAlign.center,
                            style: provider.isDark()
                                ? MyTheme.darkTheme.textTheme.bodyLarge
                                : MyTheme.lightTheme.textTheme.bodyLarge),
                      ),
                    ],
                  ),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(arrival1,
                          textAlign: TextAlign.center,
                          style: provider.isDark()
                              ? MyTheme.darkTheme.textTheme.bodyMedium
                              : MyTheme.lightTheme.textTheme.bodyMedium),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(arrival1,
                          textAlign: TextAlign.center,
                          style: provider.isDark()
                              ? MyTheme.darkTheme.textTheme.bodyMedium
                              : MyTheme.lightTheme.textTheme.bodyMedium),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(arrival2,
                          textAlign: TextAlign.center,
                          style: provider.isDark()
                              ? MyTheme.darkTheme.textTheme.bodyMedium
                              : MyTheme.lightTheme.textTheme.bodyMedium),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(arrival2,
                          textAlign: TextAlign.center,
                          style: provider.isDark()
                              ? MyTheme.darkTheme.textTheme.bodyMedium
                              : MyTheme.lightTheme.textTheme.bodyMedium),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(arrival3,
                          textAlign: TextAlign.center,
                          style: provider.isDark()
                              ? MyTheme.darkTheme.textTheme.bodyMedium
                              : MyTheme.lightTheme.textTheme.bodyMedium),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(arrival3,
                          textAlign: TextAlign.center,
                          style: provider.isDark()
                              ? MyTheme.darkTheme.textTheme.bodyMedium
                              : MyTheme.lightTheme.textTheme.bodyMedium),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
