import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../setting_details/setting_provider.dart';

class NotfStudent extends StatelessWidget {
  const NotfStudent({super.key});

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
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NotificationRow(
              title: "You have a delay warning.",
              timeAgo: "About 1 minute ago",
              iconPath: "assets/image/notification/warning.png", // Using Image.asset
            ),
            NotificationRow(
              title: "Maintenance is currently underway",
              timeAgo: "About 1 minute ago",
              iconPath: "assets/image/notification/bell.png", // Using Image.asset
            ),
            NotificationRow(
              title: "Men Present in the Housing Facility",
              timeAgo: "About 1 minute ago",
              iconPath: "assets/image/notification/bell.png", // Using Image.asset
            ),
            NotificationRow(
              title: "Your Maintenance Request Has Been Accepted",
              timeAgo: "About 1 minute ago",
              iconPath: "assets/image/notification/maintenanceIcon.png", // Using Image.asset
            ),
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
          ],
        ),
      ),
    );
  }
}

// NotificationRow Widget for Reusability
class NotificationRow extends StatelessWidget {
  final String title;
  final String timeAgo;
  final String iconPath;

  const NotificationRow({
    Key? key,
    required this.title,
    required this.timeAgo,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade200,
                ),
                width: 45,
                height: 45,
                child: Image.asset(
                  iconPath,
                  color: MyTheme.KohliIconColor,
                  width: 25,
                  height: 25,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: provider.isDark()
                        ? MyTheme.darkTheme.textTheme.bodyLarge
                        : MyTheme.lightTheme.textTheme.bodyLarge,
                  ),
                  Text(
                    timeAgo,
                    style: provider.isDark()
                        ? MyTheme.darkTheme.textTheme.bodyMedium
                        : MyTheme.lightTheme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.more_vert,
              color: Colors.grey.shade400,
              size: 25,
            ),
          ],
        ),
        Divider(
          height: 30,
          color: Colors.grey.shade400,
          thickness: 1,
          indent: 50,
          endIndent: 50,
        ),
      ],
    );
  }
}
