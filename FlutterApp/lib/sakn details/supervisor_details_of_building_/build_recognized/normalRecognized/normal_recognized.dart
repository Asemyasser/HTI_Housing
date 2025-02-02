import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../AppTheme.dart';
import '../../../../setting_details/setting_provider.dart';
import '9builds/AlFarabiRecognized.dart';
import '9builds/AlHassanRecognized.dart';
import '9builds/AlKandy_recognized.dart';
import '9builds/AlRaziRecognized.dart';
import '9builds/AlTabariRecognized.dart';
import '9builds/AlZahraaRecognized.dart';
import '9builds/AljabartiRecognized.dart';
import '9builds/IbnSinaRecognized.dart';
import '9builds/JaberIbnHayyaRecognized.dart';

class normalRecognized extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> names = [
      AppLocalizations.of(context)!.al_kindy,
      AppLocalizations.of(context)!.al_zahraa,
      AppLocalizations.of(context)!.al_razi,
      AppLocalizations.of(context)!.al_tabari,
      AppLocalizations.of(context)!.al_hassan,
      AppLocalizations.of(context)!.al_jabarti,
      AppLocalizations.of(context)!.ibn_sina,
      AppLocalizations.of(context)!.al_farabi,
      AppLocalizations.of(context)!.jaber_ibn_hayyan
    ];

      var provider = Provider.of<SettingProvider>(context);

      return Scaffold(
        backgroundColor: provider.isDark()
            ? MyTheme.darkTheme.scaffoldBackgroundColor
            : MyTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2A4D),
        leading: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // مسافة مناسبة من اليمين واليسار
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
        title: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.recognized,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // 2 columns in the grid
              crossAxisSpacing: 10.0, // Space between columns
              mainAxisSpacing: 10.0, // Space between rows
              padding: const EdgeInsets.all(10.0), // Padding around the grid
              children: List.generate(9, (index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to the corresponding screen based on the name
                    if (names[index] ==
                        AppLocalizations.of(context)!.al_kindy) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlKandyRecognized(),
                        ),
                      );
                    } else if (names[index] ==
                        AppLocalizations.of(context)!.al_zahraa) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlZahraaRecognized(),
                        ),
                      );
                    } else if (names[index] ==
                        AppLocalizations.of(context)!.al_razi) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlRaziRecognized(),
                        ),
                      );
                    } else if (names[index] ==
                        AppLocalizations.of(context)!.al_tabari) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlTabariRecognized(),
                        ),
                      );
                    } else if (names[index] ==
                        AppLocalizations.of(context)!.al_hassan) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlHassanRecognized(),
                        ),
                      );
                    } else if (names[index] ==
                        AppLocalizations.of(context)!.al_jabarti) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AljabartiRecognized(),
                        ),
                      );
                    } else if (names[index] ==
                        AppLocalizations.of(context)!.ibn_sina) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IbnSinaRecognized(),
                        ),
                      );
                    } else if (names[index] ==
                        AppLocalizations.of(context)!.al_farabi) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlFarabiRecognized(),
                        ),
                      );
                    } else if (names[index] ==
                        AppLocalizations.of(context)!.jaber_ibn_hayyan) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JaberIbnHayyaRecognized(),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 150,
                      width: 170,
                      decoration: BoxDecoration(
                        color:
                            Color(0xFFF0F0F0), // Background color of the boxes
                        borderRadius: BorderRadius.all(
                            Radius.circular(20.0)), // Rounded corners
                      ),
                      child: Center(
                        child: Text(
                          names[
                              index], // Display the name corresponding to the index
                          style: TextStyle(
                            color: Color(0xFF1C2833), // Text color
                            fontSize: 18, // Text size
                            fontWeight: FontWeight.w700, // Text weight
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
