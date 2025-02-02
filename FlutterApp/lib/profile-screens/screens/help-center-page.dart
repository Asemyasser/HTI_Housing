import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.kohli,
        title: Center(
          child: Text(
            "Help Center",
            style: TextStyle(color: Colors.white),
          ),
        ),
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
      body: Container(
        color:
            provider.isDark() ? MyTheme.kohli : Colors.white, // الخلفية البيضاء
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Contact numbers for housing supervisors",
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.lightTheme.textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: 16),
            _buildCard(
                "Al-Safwa",
                [
                  {"name": "Ms Samar", "number": "01009400637"},
                  {"name": "Ms Ansaf", "number": "01008967614"},
                  {"name": "Ms Aya", "number": "01019654005"},
                ],
                provider),
            SizedBox(height: 16),
            _buildCard(
                "Al-62",
                [
                  {"name": "Ms Amira", "number": "01025483580"},
                  {"name": "Ms Asmaa", "number": "010095888714"},
                  {"name": "Ms Roqia", "number": "01007119209"},
                ],
                provider),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String housingName, List<Map<String, String>> supervisors,
      SettingProvider provider) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border:
              Border.all(color: MyTheme.pinkColor, width: 2), // الحواف الوردية
          color:
              provider.isDark() ? MyTheme.kohli : Colors.white, // اللون الداخلي
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                housingName,
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.lightTheme.textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: 12),
            Column(
              children: supervisors.map((supervisor) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: provider.isDark() ? MyTheme.kohli : Colors.white,
                        border: Border.all(
                            color: MyTheme.pinkColor,
                            width: 2), // الحواف الوردية
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: Column(
                        children: [
                          Text(
                            supervisor["name"]!,
                            style: provider.isDark()
                                ? MyTheme.darkTheme.textTheme.titleSmall
                                : MyTheme.lightTheme.textTheme.titleSmall,
                          ),
                          Divider(
                            color: MyTheme.pinkColor,
                            thickness: 0.8,
                          ), // الخط الفاصل
                          Text(
                            supervisor["number"]!,
                            style: provider.isDark()
                                ? MyTheme.darkTheme.textTheme.titleSmall
                                : MyTheme.lightTheme.textTheme.titleSmall,
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
