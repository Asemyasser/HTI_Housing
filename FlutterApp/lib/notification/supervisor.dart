import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradproject/notification/student.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../setting_details/setting_provider.dart';

class NotfSupuervisor extends StatelessWidget {
  const NotfSupuervisor({super.key});

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
          title: Text(
            "Notifications",
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
                width: 24.0, // زيادة الأبعاد لجعل الأيقونة أسهل في النقر
                height: 24.0,
                color: Colors.white,
              ),
            ),
          ),
        leadingWidth: 56.0, // التأكد من أن العرض مناسب للأيقونة
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NotificationRow(
              title: "Your Delay Permission Has Been Accepted",
              timeAgo: "About 1 minute ago",
              iconPath: "assets/image/notification/delay.png", // Using Image.asset
            ),
            NotificationRow(
              title: "Your Exit Permission Has Been Accepted",
              timeAgo: "About 1 minute ago",
              iconPath: "assets/image/notification/exit.png", // Using Image.asset
            ),
          NotificationRow(
          title: "Your Maintenance Request Has Been Accepted",
    timeAgo: "About 1 minute ago",
    iconPath: "assets/image/notification/maintenanceIcon.png", // Using Image.asset
    ),


    NotificationRow(
    title: "Your Exit Permission Has Been Accepted",
    timeAgo: "About 1 minute ago",
    iconPath: "assets/image/notification/exit.png", // Using Image.asset
    ),])));}}