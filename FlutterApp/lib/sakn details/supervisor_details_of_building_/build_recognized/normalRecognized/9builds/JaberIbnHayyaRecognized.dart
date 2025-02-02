import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../AppTheme.dart';
import '../../../../../setting_details/setting_provider.dart';

class JaberIbnHayyaRecognized extends StatelessWidget {
  final List<Map<String, dynamic>> studentsFourthFloor = [
    {'name': 'salma ibrahim', 'room': '2'},
    {'name': 'omnia ahmed', 'room': '2'},
    {'name': 'salma ibrahim', 'room': '2'},
    {'name': 'omnia ahmed', 'room': '2'},
  ];

  final List<Map<String, dynamic>> studentsFifthFloor = [
    {'name': 'salma ibrahim', 'room': '2'},
    {'name': 'omnia ahmed', 'room': '2'},
    {'name': 'salma ibrahim', 'room': '2'},
    {'name': 'omnia ahmed', 'room': '2'},
  ];

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFloorSection(
                AppLocalizations.of(context)!.first_floor, studentsFourthFloor),
            buildFloorSection(AppLocalizations.of(context)!.second_floor,
                studentsFourthFloor),
            buildFloorSection(
                AppLocalizations.of(context)!.third_floor, studentsFourthFloor),
            buildFloorSection(AppLocalizations.of(context)!.fourth_floor,
                studentsFourthFloor),
            buildFloorSection(
                AppLocalizations.of(context)!.fifth_floor, studentsFifthFloor),
          ],
        ),
      ),
    );
  }

  Widget buildFloorSection(String title, List<Map<String, dynamic>> students) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: 200, // Height of student cards
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: students.length,
              itemBuilder: (context, index) {
                return buildStudentCard(
                  context, // تمرير السياق هنا
                  students[index]['name'],
                  students[index]['room'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStudentCard(BuildContext context, String name, String room) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(
              'assets/image/saknDetails/image.png',
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                AppLocalizations.of(context)!.roomm, // استخدام السياق هنا
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                room,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
