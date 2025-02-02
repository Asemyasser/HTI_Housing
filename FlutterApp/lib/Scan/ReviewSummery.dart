import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradproject/homescreen/home_female.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../AppTheme.dart';
import '../setting_details/setting_provider.dart';
import 'MyRoom.dart';

class ReviewSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    // بيانات ديناميكية:
    String build = "AL-Safwa";
    String floor = "Fourth Floor";
    String bookingData = "6 October | 10:00AM";
    String checkInDate = "6 October, 2024";
    String checkOutDate = "6 December, 2025";
    String price = "5000 EGP";
    String personName = "Salma Ibrahim";
    String email = "Salma.ibrahim@gmail.com";
    String phone = "011202022020";

    return Scaffold(
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: MyTheme.kohli,
        title: Text(
          AppLocalizations.of(context)!.reviewSummaryTitle,
          style: provider.isDark()
              ? MyTheme.darkTheme.textTheme.titleLarge
              : MyTheme.lightTheme.textTheme.titleLarge,
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/image/backIcon.svg',
              width: 24.0,
              height: 24.0,
              color: Colors.white,
            ),
          ),
        ),
        leadingWidth: 56.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8), bottom: Radius.circular(8)),
                  child: Image.asset(
                    "assets/image/onBoirdin2.jpg",
                    height: 150,
                    width: 100,
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(build,

                  style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(build),
                      Text(floor),
                    ],
                  ),
                )
              ]),
              SizedBox(height: 50),
              _buildRow(context,
                  AppLocalizations.of(context)!.bookingDate, bookingData),
              _buildRow(context, AppLocalizations.of(context)!.checkIn,
                  checkInDate),
              _buildRow(context, AppLocalizations.of(context)!.checkOut,
                  checkOutDate),
              _buildRow(context, AppLocalizations.of(context)!.totalPrice,
                  price),
              SizedBox(height: 16),
              _buildRow(context, AppLocalizations.of(context)!.userName,
                  personName),
              _buildRow(context, AppLocalizations.of(context)!.userEmail, email),
              _buildRow(context, AppLocalizations.of(context)!.userPhone, phone),
              SizedBox(height: 35),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: provider.isDark()
                            ? MyTheme.romady
                            : MyTheme.kohli,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Myroom()),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.viewMyRoom,
                        style: provider.isDark()
                            ? MyTheme.lightTheme.textTheme.titleSmall
                            : MyTheme.darkTheme.textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: provider.isDark()
                            ? MyTheme.romady
                            : MyTheme.kohli,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeFemaleStudent()),
                        );
                      },
                      child: Text(AppLocalizations.of(context)!.continueButton,
                        style: provider.isDark()
                            ? MyTheme.lightTheme.textTheme.titleSmall
                            : MyTheme.darkTheme.textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}
