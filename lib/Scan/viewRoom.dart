import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../setting_details/setting_provider.dart';

class Viewroom extends StatelessWidget {
  const Viewroom({super.key});

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
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/Vector.png"),
              Text("Congratulations!"),
              Text("Your Room successfully Booked"),
              Text("You can check your booking in the menu profile."),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1A2A4D)),
                  onPressed: () {},
                  child: Text("View My Booking"))
            ],
          ),
        ),
      ),
    );
  }
}
