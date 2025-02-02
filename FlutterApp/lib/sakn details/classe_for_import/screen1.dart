import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';

class ScreenOne extends StatelessWidget {
  final String? buildingName;
  final String? Neighborhoodnumber;
  final List<scroll>? scrollList;
  final List<scroll>? scrollListlist;
  final List<List<scrollTwo>>? scrollTwoList;
  final List<String>? FloorNumberList;

  ScreenOne({
    this.FloorNumberList,
    this.scrollListlist,
    this.buildingName,
    this.Neighborhoodnumber,
    this.scrollList,
    this.scrollTwoList,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Scaffold(
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: MyTheme.kohli,
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
        title: Neighborhoodnumber == null || Neighborhoodnumber!.isEmpty
            ? Text(
          buildingName ?? "Unknown Building",
          style: provider.isDark()
              ? MyTheme.darkTheme.textTheme.titleSmall
              : MyTheme.lightTheme.textTheme.titleSmall,
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buildingName ?? "Unknown Building",
              style: provider.isDark()
                  ? MyTheme.darkTheme.textTheme.titleLarge
                  : MyTheme.lightTheme.textTheme.titleLarge,
            ),
            Text(
              Neighborhoodnumber!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (scrollList != null && scrollList!.isNotEmpty)
                Text(
            AppLocalizations.of(context)!.building_consists_of,
                  style: provider.isDark()
                      ? MyTheme.darkTheme.textTheme.bodyLarge
                      : MyTheme.lightTheme.textTheme.bodyLarge,
                ),
              if (scrollList != null)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: scrollList!.map((item) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: item,
                      );
                    }).toList(),
                  ),
                ),
              if (scrollListlist != null && scrollListlist!.isNotEmpty)
                Text(
                  AppLocalizations.of(context)!.entertainment_facilities,
                  style: provider.isDark()
                      ? MyTheme.darkTheme.textTheme.bodyLarge
                      : MyTheme.lightTheme.textTheme.bodyLarge,
                ),
              if (scrollListlist != null)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: scrollListlist!.map((item) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: item,
                      );
                    }).toList(),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  AppLocalizations.of(context)!.available_room,
                  style: provider.isDark()
                      ? MyTheme.darkTheme.textTheme.bodyLarge
                      : MyTheme.lightTheme.textTheme.bodyLarge,
                ),
              ),
              if (FloorNumberList != null && scrollTwoList != null)
                ...FloorNumberList!.asMap().entries.map((entry) {
                  int index = entry.key;
                  String floorNumber = entry.value;
                  var innerList = scrollTwoList![index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          floorNumber,
                          style: provider.isDark()
                              ? MyTheme.darkTheme.textTheme.bodyMedium
                              : MyTheme.lightTheme.textTheme.bodyMedium,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: innerList.map((item) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: item,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}


class scroll extends StatelessWidget {
  final String iconName;
  final String? iconTitle;
  final String? iconText;

  scroll(
      {required this.iconName,
      required this.iconTitle,
       this.iconText});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: provider.isDark() ? MyTheme.romady : MyTheme.kohli,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconName,
              color: provider.isDark()
                  ? MyTheme.KohliIconColor
                  :Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: Text(iconTitle!,
                  style: provider.isDark()
                      ? MyTheme.lightTheme.textTheme.bodySmall
                      : MyTheme.darkTheme.textTheme.bodySmall),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: Text(iconText!,
                  style: provider.isDark()
                      ? MyTheme.lightTheme.textTheme.bodySmall
                      : MyTheme.darkTheme.textTheme.bodySmall),
            ),
          ],
        ),
      ),
    );
  }
}

class scrollTwo extends StatelessWidget {
  final Widget Function()? routeClass;
  final String? apartmentNumber;
  final String? roomNumber;


  scrollTwo({
    this.apartmentNumber,
    required this.roomNumber,

    this.routeClass,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (routeClass != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => routeClass!(),
              ),
            );
          }
          // Do nothing if routeClass is null
        },
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Center(
                    // Center the image inside the container
                    child: Image.asset(
                      "assets/image/sakn/door.png",
                      width: 200, // Adjust the height if needed
                      height: 180, // Adjust the width if needed
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(apartmentNumber ?? "",
                            style: provider.isDark()
                                ? MyTheme.lightTheme.textTheme.titleSmall
                                : MyTheme.lightTheme.textTheme.titleSmall),
                        Text(AppLocalizations.of(context)!.roomNumber(roomNumber ?? ''),
                            style: provider.isDark()
                                ? MyTheme.lightTheme.textTheme.titleSmall
                                : MyTheme.lightTheme.textTheme.titleSmall),

                      ],
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
}
