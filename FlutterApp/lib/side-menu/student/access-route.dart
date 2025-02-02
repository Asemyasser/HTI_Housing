import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';
class Accessroute extends StatelessWidget {
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    final List<Map<String, String>> routes = [
      {
        "title":AppLocalizations.of(context)!.safwa,
        "neighborhood": AppLocalizations.of(context)!.neighborhood1,
        "description": AppLocalizations.of(context)!.description11,
        "location": "https://www.google.com/maps?q=30.301023343178308, 31.758438788684813"

      },
      {
        "title": AppLocalizations.of(context)!.al62,
        "neighborhood": AppLocalizations.of(context)!.neighborhood2,
        "description": AppLocalizations.of(context)!.description22,
        "location": "https://www.google.com/maps?q=30.315671299583983, 31.775858613779032"
      },
      {
        "title": AppLocalizations.of(context)!.normal,
        "neighborhood": AppLocalizations.of(context)!.neighborhood3,
        "description": AppLocalizations.of(context)!.description33,
        "location": "https://www.google.com/maps?q=30.29965896684872, 31.776545235063594"
      },
      {
        "title": AppLocalizations.of(context)!.diafa,
        "neighborhood": AppLocalizations.of(context)!.neighborhood4,
        "description": AppLocalizations.of(context)!.description44,
        "location": "https://www.google.com/maps?q=30.301081006719137, 31.78033322100903 "
      },
    ];

    return Scaffold(backgroundColor:
      provider.isDark()?MyTheme.darkTheme.scaffoldBackgroundColor:MyTheme.lightTheme.scaffoldBackgroundColor,
        appBar: AppBar(
        backgroundColor:MyTheme.kohli,
        title: Center(child: Text(AppLocalizations.of(context)!.accross,style: provider.isDark()
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
          return GestureDetector(
            onTap: () => _launchURL(routes[index]['location']!),
              child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Container(
              height: 131,
              width: 343,
              decoration: BoxDecoration(
                color:provider.isDark()?MyTheme.kohli:Colors.white,
                border: Border.all(color:provider.isDark()?MyTheme.romady:MyTheme.kohli, width: 2), // حدود سوداء
                borderRadius: BorderRadius.all(Radius.circular(20)), // حواف مقوسة
              ),
              child: Row(
                children: [
                  Container(
                    height: 121, // تحديد ارتفاع الصورة
                    width: 124, // تحديد عرض الصورة
                    child: Image.asset(
                      'assets/image/location.png',
                    ),
                  ),
                  SizedBox(width: 8), // مسافة بين الصورة والنص
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          routes[index]['title']!,
                          style:provider.isDark()
                              ?MyTheme.darkTheme.textTheme.bodyLarge
                              :MyTheme.lightTheme.textTheme.bodyLarge, // لون النص
                        ),
                        SizedBox(height: 2),
                        Text(
                          routes[index]['neighborhood']!,
                          style:provider.isDark()?MyTheme.darkTheme.textTheme.bodyMedium:MyTheme.lightTheme.textTheme.bodyMedium // لون النص
                        ),
                        Text(
                          routes[index]['description']!,
                            style:provider.isDark()?MyTheme.darkTheme.textTheme.bodyMedium:MyTheme.lightTheme.textTheme.bodyMedium // لون النص
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
            );
        },
      ),
    );
  }
}
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class Accessroute extends StatelessWidget {
//   final List<Map<String, String>> routes = [
//     {
//       "title": "Al-Safwa",
//       "neighborhood": "Neighborhood(24)",
//       "description": "From the station, take Taxi.",
//       "location": "https://www.google.com/maps?q=30.0444,31.2357" // أضف رابط الموقع هنا
//     },
//     {
//       "title": "Al-62",
//       "neighborhood": "Neighborhood(62)",
//       "description": "From the station, take Microbus line 6.",
//       "location": "https://www.google.com/maps?q=30.0500,31.2333" // أضف رابط الموقع هنا
//     },
//     {
//       "title": "Al-Normal",
//       "neighborhood": "Neighborhood(31)",
//       "description": "From the station, take Microbus line 2.",
//       "location": "https://www.google.com/maps?q=30.0560,31.2300" // أضف رابط الموقع هنا
//     },
//     {
//       "title": "Al-Diafa",
//       "neighborhood": "Neighborhood(31)",
//       "description": "From the station, take Microbus line 2.",
//       "location": "https://www.google.com/maps?q=30.0590,31.2280" // أضف رابط الموقع هنا
//     },
//   ];
//
//   Future<void> _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0xFF1A2A4D),
//           title: Center(child: Text("Access route")),
//           leading: GestureDetector(
//             onTap: () {
//               Navigator.pop(context); // الرجوع إلى الشاشة السابقة عند الضغط
//             },
//             child: ImageIcon(
//               AssetImage('assets/icons/Vector-back.png'),
//               size: 25.0,
//             ),
//           ),
//         ),
//         body: ListView.builder(
//             itemCount: routes.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () => _launchURL(routes[index]['location']!), // افتح الرابط عند الضغط
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 131,
//                     width: 343,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: Color(0xFF1C2833), width: 2),
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 121,
//                           width: 124,
//                           child: Image.asset(
//                             'assets/sidemenu/location.png',
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         SizedBox(width: 8),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 routes[index]['title']!,
//                                 style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Color(0xFF1C2833)),
//                               ),
//                               SizedBox(height: 2),
//                               Text(
//                                 routes[index]['neighborhood']!,
//                                 style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF1C2833)),
//                               ),
//                               Text(
//                                 routes[index]['description']!,
//                                 style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF1C2833)),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//             ),
//         );
//     }
// }