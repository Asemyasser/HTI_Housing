import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../AppTheme.dart';
import '../../../setting_details/setting_provider.dart';
import '../supervisor/holiday_exit/holiday1.dart';
import '../supervisor/maintenanceRequests/Maintenance2.dart';
import 'maintenance_manger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MaintenanceManger extends StatelessWidget {
  const MaintenanceManger({super.key});

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
              routeClass: () => MaintenanceManger2(),
            ),
            maintaninceContainer(
              personName: "Malak Mohamed",
              routeClass: () => MaintenanceManger2(),
            ),
            maintaninceContainer(
              personName: "Salma Ayman",
              routeClass: () => MaintenanceManger2(),
            ),
          ],
        ),
      ),
    );
  }
}

class maintaninceContainer extends StatelessWidget {
  final Widget Function() routeClass;
  final String? personName;

  const maintaninceContainer({
    required this.routeClass,
    this.personName,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Container(
        padding: EdgeInsets.all(20),
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
              AppLocalizations.of(context)!.youhaveAmaintenance(personName?? ''),
              style: provider.isDark()
                  ? MyTheme.darkTheme.textTheme.bodyLarge
                  : MyTheme.lightTheme.textTheme.bodyLarge,
            ),
            SizedBox(height: 20),
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
                  child: SizedBox(
                    height: 50,
                    width: 110,
                    child: TextButton(
                      onPressed: () {
                        _showSuccessDialog(context);
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(Icons.check_circle, color: Colors.green, size: 60),
          content: Text(AppLocalizations.of(context)!.successDialogTitle),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(AppLocalizations.of(context)!.ok),
            ),
          ],
        );
      },
    );
  }
}
