import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';

class Recognized extends StatelessWidget {
  final String? buildingName;
  final List<List<RecognizeList>>? scrollTwoList;
  final List<String>? floorNumberList;

  Recognized({this.buildingName, this.floorNumberList, this.scrollTwoList});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Scaffold(backgroundColor: provider.isDark()
        ? MyTheme.darkTheme.scaffoldBackgroundColor
        : MyTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(

        toolbarHeight: 100,
        backgroundColor:  MyTheme.kohli,
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
          buildingName ?? "Unknown Building",
          style: provider.isDark()
              ? MyTheme.darkTheme.textTheme.titleLarge
              : MyTheme.lightTheme.textTheme.titleLarge,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: floorNumberList?.length ?? 0,  // Ensure floorNumberList is not null
              itemBuilder: (context, index) {
                String floorNumber = floorNumberList![index];  // Non-nullable here
                var innerList = scrollTwoList![index];  // Non-nullable here

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(floorNumber,style:provider.isDark()
                          ? MyTheme.darkTheme.textTheme.titleSmall
                          : MyTheme.lightTheme.textTheme.titleSmall),  // Display the floor number above the row
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,  // Horizontal scrolling for the row
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
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RecognizeList extends StatelessWidget {
  final String? name;
  final String? roomNumber;
  RecognizeList({this.roomNumber, this.name});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            child:Image.asset("assets/image/saknDetails/image.png"),
          ),
          Text(name ?? "No Name",style: provider.isDark()
              ? MyTheme.darkTheme.textTheme.titleSmall
              : MyTheme.lightTheme.textTheme.titleSmall), // Null check for name
          Text(roomNumber ?? "No Room Number",style:provider.isDark()
              ? MyTheme.darkTheme.textTheme.bodySmall
              : MyTheme.lightTheme.textTheme.bodySmall), // Null check for room number
        ],
      ),
    );
  }
}
