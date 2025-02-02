import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradproject/signup_login/login.dart';
import 'package:gradproject/signup_login/signup.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../sakn details/classe_for_import/screen1.dart';
import '../setting_details/setting_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Myroom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    List<scroll> scrollList = [
      scroll(
          iconName: "assets/image/saknDetails/floor.svg",
          iconTitle: AppLocalizations.of(context)!.floor,
          iconText: AppLocalizations.of(context)!.a2),
      scroll(
          iconName: "assets/image/saknDetails/bed.svg",
          iconTitle: AppLocalizations.of(context)!.roomm,
          iconText: AppLocalizations.of(context)!.double20floor),
      scroll(
          iconName: "assets/image/saknDetails/bathroom.svg",
          iconTitle: AppLocalizations.of(context)!.bathroom,
          iconText: AppLocalizations.of(context)!.a10floor),
      scroll(
          iconName: "assets/image/saknDetails/kitchen.svg",
          iconTitle: AppLocalizations.of(context)!.kitchen,
          iconText: AppLocalizations.of(context)!.a1floor),
      scroll(
          iconName: "assets/image/saknDetails/stove.svg",
          iconTitle: AppLocalizations.of(context)!.stove,
          iconText: AppLocalizations.of(context)!.a5kitchen),
      scroll(
          iconName: "assets/image/saknDetails/coldair.svg",
          iconTitle: AppLocalizations.of(context)!.coldair,
          iconText: AppLocalizations.of(context)!.a1floor),
      scroll(
          iconName: "assets/image/saknDetails/tv.svg",
          iconTitle: AppLocalizations.of(context)!.screen,
          iconText: ""),
      scroll(
          iconName: "assets/image/saknDetails/entertainment.svg",
          iconTitle: AppLocalizations.of(context)!.entertainment,
          iconText: AppLocalizations.of(context)!.roomm),
      scroll(
          iconName: "assets/image/saknDetails/tree.svg",
          iconTitle: AppLocalizations.of(context)!.fruit_trees,
          iconText: ""),
      scroll(
          iconName: "assets/image/saknDetails/greenArea.svg",
          iconTitle: AppLocalizations.of(context)!.green_area,
          iconText: "  "),
    ];

    return Scaffold(
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: MyTheme.kohli,
        title: Text(
          AppLocalizations.of(context)!.myRoom,
          style: provider.isDark()
              ? MyTheme.darkTheme.textTheme.titleLarge
              : MyTheme.lightTheme.textTheme.titleLarge,
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // مسافة مناسبة من اليمين واليسار
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/image/backIcon.svg',
              width: 24.0,
              color: Colors.white,
            ),
          ),
        ),
        leadingWidth: 56.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/image/saknDetails/bookroom.jpg",
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Room:12",
                    style: provider.isDark()
                        ? MyTheme.darkTheme.textTheme.bodyLarge
                        : MyTheme.lightTheme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context)!.about,
                    style: provider.isDark()
                        ? MyTheme.darkTheme.textTheme.bodyMedium
                        : MyTheme.lightTheme.textTheme.bodyMedium,
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: scrollList,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(100),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    _showLeaveRoomDialog(context, provider); // عرض النافذة المنبثقة
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    provider.isDark() ? MyTheme.romady : MyTheme.kohli,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.evacuatetheroom,
                    style: provider.isDark()
                        ? MyTheme.lightTheme.textTheme.titleSmall
                        : MyTheme.darkTheme.textTheme.titleSmall,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLeaveRoomDialog(BuildContext context, SettingProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.logout,
                size: 50,
                color: Colors.grey,
              ),
              SizedBox(height: 20),
              Text(
"Are you sure you want to leave the room?",                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildDialogButton(
                    text: "Cancel",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.blue,
                  ),
                  buildDialogButton(
                    text: "Leave",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildDialogButton({
    required String text,
    required VoidCallback onPressed,
    required Color backgroundColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );

}}
