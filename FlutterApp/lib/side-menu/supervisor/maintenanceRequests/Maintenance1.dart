import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../AppTheme.dart';
import '../../../setting_details/setting_provider.dart';
import '../holiday_exit/holiday1.dart';
import 'Maintenance2.dart';

class Maintenance1 extends StatelessWidget {
  const Maintenance1({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Scaffold(
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: provider.isDark()
            ? MyTheme.darkTheme.appBarTheme.backgroundColor
            : MyTheme.lightTheme.appBarTheme.backgroundColor,
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
        title: Text(
          AppLocalizations.of(context)!.request,
          style: provider.isDark()
              ? MyTheme.darkTheme.textTheme.titleLarge
              : MyTheme.lightTheme.textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            maintaninceContainer(
              personName: "Salma Ibrahim",
              () => Maintenance2(),
              () => HolidayOne(),
            ),
            maintaninceContainer(
              personName: "Malak mohamed",
              () => Maintenance2(),
              () => HolidayOne(),
            ),
            maintaninceContainer(
              personName: "Salma Ayman",
              () => Maintenance2(),
              () => HolidayOne(),
            ),
            maintaninceContainer(
              personName: "Salma Ibrahim",
              () => Maintenance2(),
              () => HolidayOne(),
            ),
            maintaninceContainer(
              personName: "Malak mohamed",
              () => Maintenance2(),
              () => HolidayOne(),
            ),
            maintaninceContainer(
              personName: "Salma Ayman",
              () => Maintenance2(),
              () => HolidayOne(),
            ),
          ],
        ),
      ),
    );
  }
}

class maintaninceContainer extends StatelessWidget {
  final Widget Function() routeClass; // Renamed for clarity
  final Widget Function() routeClassDone; // Renamed for clarity
  final String? personName;
  maintaninceContainer(this.routeClass, this.routeClassDone, {this.personName});
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(
                color: provider.isDark() ? MyTheme.romady : MyTheme.kohli,
                width: 1),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
              AppLocalizations.of(context)!.youhaveAmaintenance(personName ?? ''),
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.lightTheme.textTheme.bodyLarge,
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    height: 50,
                    width: 110,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => routeClass()));
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:
                            provider.isDark() ? MyTheme.romady : MyTheme.kohli,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                          AppLocalizations.of(context)!.more,
                        style: provider.isDark()
                            ? MyTheme.lightTheme.textTheme.bodyMedium
                            : MyTheme.darkTheme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    height: 50,
                    width: 110,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => routeClassDone()));
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.done,
                        style: MyTheme.buttonText,
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
