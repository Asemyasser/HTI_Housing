import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../Scan/uploadImage.dart';
import '../setting_details/setting_provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookRoom extends StatefulWidget {
  @override
  _BookRoomState createState() => _BookRoomState();
}

class _BookRoomState extends State<BookRoom> {
  // تواريخ افتراضية
  DateTime selectedCheckInDate = DateTime.now();
  DateTime selectedCheckOutDate = DateTime.now().add(const Duration(days: 30));

  // الحصول على قائمة من الأيام التالية
  List<DateTime> getDates(DateTime startDate, int daysCount) {
    return List.generate(
        daysCount, (index) => startDate.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    final checkInDates = getDates(DateTime.now(), 30); // قائمة تواريخ Check-in
    final checkOutDates = getDates(DateTime.now().add(const Duration(days: 1)),
        30); // قائمة تواريخ Check-out

    return Scaffold(
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: MyTheme.kohli,
        title: Center(
            child: Text(
          AppLocalizations.of(context)!.bookRoom,
          style: provider.isDark()
              ? MyTheme.darkTheme.textTheme.titleLarge
              : MyTheme.lightTheme.textTheme.titleLarge,
        )),

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
//
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // قسم Check in
             Text(
                AppLocalizations.of(context)!.checkIn,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: checkInDates.length,
                itemBuilder: (context, index) {
                  final date = checkInDates[index];
                  final isSelected = date.day == selectedCheckInDate.day &&
                      date.month == selectedCheckInDate.month &&
                      date.year == selectedCheckInDate.year;
                  return _buildDateItem(
                    date: date,
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        selectedCheckInDate = date;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // قسم Check out
             Text(          AppLocalizations.of(context)!.checkOut,

                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: checkOutDates.length,
                itemBuilder: (context, index) {
                  final date = checkOutDates[index];
                  final isSelected = date.day == selectedCheckOutDate.day &&
                      date.month == selectedCheckOutDate.month &&
                      date.year == selectedCheckOutDate.year;
                  return _buildDateItem(
                    date: date,
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        selectedCheckOutDate = date;
                      });
                    },
                  );
                },
              ),
            ),
            Spacer(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: provider.isDark()
                      ? MyTheme.kohli
                      : Colors.white, // لون الخلفية
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: provider.isDark()
                          ? Color(0xFF2B447B)
                          : Colors.grey.shade300,
                      blurRadius: 10.0,
                      offset: Offset(0, -4), // الظل من الأعلى
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                      AppLocalizations.of(context)!.totalPrice,

                            style: provider.isDark()
                                ? MyTheme.darkTheme.textTheme.titleSmall
                                : MyTheme.lightTheme.textTheme.titleSmall,
                          ),
                          Text(
                              AppLocalizations.of(context)!.price,
                            style: provider.isDark()
                                ? MyTheme.darkTheme.textTheme.titleSmall
                                : MyTheme.lightTheme.textTheme.titleSmall,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageUpload(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: provider.isDark()
                              ? MyTheme.romady
                              : MyTheme.kohli,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.continueButton,

                          style: provider.isDark()
                              ? MyTheme.lightTheme.textTheme.titleSmall
                              : MyTheme.darkTheme.textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateItem({
    required DateTime date,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _getDayOfWeek(date),
              style: TextStyle(
                fontSize: 14,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            Text(
              '${date.day}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDayOfWeek(DateTime date) {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return days[date.weekday % 7];
  }
}
