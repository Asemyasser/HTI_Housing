import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';

class Servicesprovided extends StatelessWidget {




@override
Widget build(BuildContext context) {
  var provider = Provider.of<SettingProvider>(context);
  final List<Map<String, String>> routes = [
    {
      "title": AppLocalizations.of(context)!.supervisorsTitle,
      "description": AppLocalizations.of(context)!.supervisorsDescription,
      "image":"assets/image/slideMenue/1.png"
    },{
      "title": AppLocalizations.of(context)!.securityGuardsTitle,
      "description": AppLocalizations.of(context)!.securityGuardsDescription,
      "image":"assets/image/slideMenue/2.png"
    },
    {
      "title": AppLocalizations.of(context)!.internalTransportationTitle,
      "description":AppLocalizations.of(context)!.internalTransportationDescription,
      "image":"assets/image/bus.png"
    },
    {
      "title": AppLocalizations.of(context)!.maintenanceCleanlinessTitle,
      "description": AppLocalizations.of(context)!.maintenanceCleanlinessDescription,
      "image":"assets/image/slideMenue/3.png"

    },
    {
      "title":AppLocalizations.of(context)!.wifiTitle,
      "description":AppLocalizations.of(context)!.wifiDescription,
      "image":"assets/image/slideMenue/4.png"

    },
    {
      "title": AppLocalizations.of(context)!.medicalServicesTitle,
      "description":AppLocalizations.of(context)!.medicalServicesDescription1,
      "image":"assets/image/slideMenue/5.png"

    },
    {
      "title": AppLocalizations.of(context)!.medicalServicesTitle,
      "description": AppLocalizations.of(context)!.medicalServicesDescription2,
      "image":"assets/image/slideMenue/6.png"

    }, {
      "title":  AppLocalizations.of(context)!.medicalServicesTitle,
      "description": AppLocalizations.of(context)!.medicalServicesDescription3,
      "image":"assets/image/slideMenue/7.png"

    },
  ];
  return Scaffold(backgroundColor:
    provider.isDark()?MyTheme.darkTheme.scaffoldBackgroundColor:MyTheme.lightTheme.scaffoldBackgroundColor

      ,appBar: AppBar(
      backgroundColor:MyTheme.kohli,
      title: Center(child: Text(AppLocalizations.of(context)!.servicesProvidedTitle, style: provider.isDark()
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
    body: ListView.builder(
      itemCount: routes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 131,
            width: 343,
            decoration: BoxDecoration(
              color:provider.isDark()? MyTheme.kohli:Colors.white, // الخلفية الداخلية باللون الأبيض
              border: Border.all(color:provider.isDark()?Colors.white:MyTheme.kohli, width: 2), // حدود سوداء
              borderRadius: BorderRadius.all(Radius.circular(20)), // حواف مقوسة
            ),
            child: Row(
              children: [
                SizedBox(width: 2,),
                Container(
                  height: 121, // تحديد ارتفاع الصورة
                  width: 124, // تحديد عرض الصورة
                  child:
                  Image.asset(
                    routes[index]['image']!,  // استخدام مسار الصورة من القائمة
                    width: 124,
                    height: 120,
                    fit: BoxFit.cover,
                  ),

                ),

                SizedBox(width: 8), // مسافة بين الصورة والنص
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        routes[index]['title']!,
                        style:provider.isDark()?MyTheme.darkTheme.textTheme.bodyLarge:MyTheme.lightTheme.textTheme.bodyLarge// لون النص
                      ),
                      SizedBox(height: 5),
                      Text(
                        routes[index]['description']!,
                        style: provider.isDark()?MyTheme.darkTheme.textTheme.bodyMedium:MyTheme.lightTheme.textTheme.bodyMedium // لون النص
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
}
