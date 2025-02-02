import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';

class MaleHelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(backgroundColor: provider.isDark()
        ? MyTheme.darkTheme.scaffoldBackgroundColor
        : MyTheme.lightTheme.scaffoldBackgroundColor,      appBar: AppBar(
        backgroundColor: MyTheme.kohli,
        title: Center(
          child: Text(
            "Help Center",
            style: TextStyle(color: Colors.white),
          ),
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
      body: Container(
        color: Colors.white, // الخلفية البيضاء
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Contact numbers for housing supervisors",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildCard("Manger", [
              {"name": "Mr wahed", "number": "01000122425"},
            ]),
            _buildCard("Al-Normal", [
              {"name": "Mr Adham", "number": "0100434148"},
              {"name": "Mr Ashraf", "number": "01009202930"},
              {"name": "Mr Amir", "number": "01006430814"},
            ]),
            SizedBox(height: 16),
            _buildCard("Al-diafa", [
              {"name": "Mr Ehab", "number": "01025483580"},
              {"name": "Mr Nasr", "number": "010095888714"},
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String housingName, List<Map<String, String>> supervisors) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.pink, width: 2), // الحواف الوردية
          color: Colors.white, // اللون الداخلي
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                housingName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 12),
            Column(
              children: supervisors.map((supervisor) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.pink, width: 2), // الحواف الوردية
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: Column(
                        children: [
                          Text(
                            supervisor["name"]!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Divider(
                            color: Colors.pink,
                            thickness: 0.8,
                          ), // الخط الفاصل
                          Text(
                            supervisor["number"]!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12), // مسافة بين كل عنصر
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
