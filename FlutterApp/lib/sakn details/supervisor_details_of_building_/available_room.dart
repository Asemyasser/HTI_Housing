import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';

class AvaliableRoom extends StatelessWidget {
  final String? buildingName;
  final int? Neighborhoodnumber;

  final List<List<scrollRoom>>? scrollRoomsList;
  final List<String>? FloorNumberList;

  AvaliableRoom({
    this.FloorNumberList,
    this.buildingName,
    this.Neighborhoodnumber,
    this.scrollRoomsList,
  });

  @override
  Widget build(BuildContext context) {
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
              AppLocalizations.of(context)!.available_room,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: ListView.builder(
            itemCount: FloorNumberList?.length ??
                0, // Use the length of FloorNumberList
            itemBuilder: (context, index) {
              // Access the floor number
              String floorNumber = FloorNumberList![index];

              // Access the corresponding inner list from scrollTwoList
              var innerList = scrollRoomsList![index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // Use a Column to stack Text and the horizontal list
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align items to the start
                  children: [
                    Text(floorNumber), // Display the floor number above the row
                    SingleChildScrollView(
                      scrollDirection:
                          Axis.horizontal, // Horizontal scrolling for the row
                      child: Row(
                        children: innerList.map((item) {
                          if (item is scrollRoom) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: item,
                            );
                          }
                          return SizedBox(); // Handle unexpected types
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ]
          // ],
          ),
    );
  }
}

class scrollRoom extends StatelessWidget {
  final String? apartmentNumber;
  final String? roomNumber;
  final String? details;

  scrollRoom(
      {this.apartmentNumber, required this.roomNumber, required this.details});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Column(
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
                    Text(
                        AppLocalizations.of(context)!
                            .roomNumber(roomNumber ?? ''),
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
    );
  }
}
