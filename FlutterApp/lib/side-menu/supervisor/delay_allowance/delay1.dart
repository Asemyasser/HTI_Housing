import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../AppTheme.dart';
import '../../../setting_details/setting_provider.dart';
import '../container.dart';
import 'delay2.dart';
import 'delay3.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Delay1 extends StatelessWidget {
  const Delay1({super.key});

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
        title: Center(
          child: Text(
              AppLocalizations.of(context)!.late,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const Delay3()), // Navigate to the Delay3 screen
                );
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.red.shade200,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: provider.isDark()?MyTheme.romady:MyTheme.kohli, width: 1),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10, left: 20),
                      child: Text(
                        AppLocalizations.of(context)!.check,
                        style: provider.isDark()
                            ? MyTheme.darkTheme.textTheme.bodyLarge
                            : MyTheme.lightTheme.textTheme.bodyLarge,
                      ),
                    ),

                    const   Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
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
                            height: 5,width: 5,
                            ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DelayContainer(
                    personName: "Salma Ibrahim",
                    routeClass: () => const Delay2(),
                  ),
                  DelayContainer(
                    personName: "Malak Mohamed",
                    routeClass: () => const Delay2(),
                  ),
                  DelayContainer(
                    personName: "Salma Ibrahim",
                    routeClass: () => const Delay2()
                  ),
                  DelayContainer(
                    personName: "Malak Mohamed",
                    routeClass: () => const Delay2(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DelayContainer extends StatelessWidget {
  final Widget Function() routeClass;
  final String? personName;



  const DelayContainer({required this.routeClass, this.personName});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          border: Border.all(
            color: provider.isDark() ? MyTheme.romady : MyTheme.kohli,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
              AppLocalizations.of(context)!.latePermission(personName ?? ''),
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.lightTheme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SizedBox(
                      height: 50,
                      width: 110,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => routeClass(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: provider.isDark()
                              ? MyTheme.romadyIconColor
                              : MyTheme.KohliIconColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child:  Text(AppLocalizations.of(context)!.more,style:provider.isDark()
                            ? MyTheme.lightTheme.textTheme.bodyLarge
                            : MyTheme.buttonText),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
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
                        child:  Text(
                          AppLocalizations.of(context)!.acceptSave,
                          style: MyTheme.buttonText,
                          textAlign: TextAlign.center, // Ensures text is centered
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
