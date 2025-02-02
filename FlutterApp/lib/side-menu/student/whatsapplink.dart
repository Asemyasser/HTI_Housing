import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';

class WhatsAppLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> routes = [
      {
        "title": AppLocalizations.of(context)!.safwa,
        "description": AppLocalizations.of(context)!.groupDescriptionFemaleStudents,
        "image": "assets/image/slideMenue/whatsapp.png",
        "link": "https://chat.whatsapp.com/GIcaiDhd7bqBx7fhoqrxZ3"
      },
      {
        "title": AppLocalizations.of(context)!.al62,
        "description": AppLocalizations.of(context)!.groupDescriptionFemaleStudents,
        "image": "assets/image/slideMenue/whatsapp.png",
        "link": "https://chat.whatsapp.com/GgCZlXwTsTTIbNeNSEs7gs", // رابط المجموعة الثاني
      },
      {
        "title": AppLocalizations.of(context)!.groupTitleManagerGroup,
        "description": AppLocalizations.of(context)!.groupDescriptionAllStudents,
        "image": "assets/image/slideMenue/whatsapp.png",
        "link": "https://chat.whatsapp.com/GgCZlXwTsTTIbNeNSEs7gs", // رابط المجموعة الثالث
      },
    ];

    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(backgroundColor: provider.isDark()?MyTheme.darkTheme.scaffoldBackgroundColor:MyTheme.lightTheme.scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2A4D),
        title:  Center(child: Text(AppLocalizations.of(context)!.whatsappLinkTitle,style: provider.isDark()
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
                color: Colors.white, // الخلفية الداخلية باللون الأبيض
                border: Border.all(color: const Color(0xFF1C2833), width: 2), // حدود سوداء
                borderRadius: const BorderRadius.all(Radius.circular(20)), // حواف مقوسة
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Container(
                    height: 121, // تحديد ارتفاع الصورة
                    width: 124, // تحديد عرض الصورة
                    child: Image.asset(
                      routes[index]['image']!, // استخدام مسار الصورة من القائمة
                      width: 124,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20), // مسافة بين الصورة والنص
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            routes[index]['title']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20, color: Color(0xFF1C2833)), // لون النص
                          ),
                          Text(
                            routes[index]['description']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF1C2833)), // لون النص
                          ),
                          Container(
                            width: 120,
                            child: MaterialButton(
                              onPressed: () async {
                                final groupLink = routes[index]['link']!;
                                final uri = Uri.parse(groupLink);

                                // طباعة الرابط للمساعدة في تتبع المشكلة
                                print("محاولة فتح الرابط: $uri");

                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("فشل في فتح الرابط.")),
                                  );
                                }
                              }
                              ,height: 40, color: const Color(0xFF03920D), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!.joinNow,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
