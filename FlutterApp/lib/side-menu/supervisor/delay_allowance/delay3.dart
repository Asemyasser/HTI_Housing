import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../setting_details/setting_provider.dart';
import 'delay4.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Delay3 extends StatefulWidget {
  const Delay3({super.key});

  @override
  _Delay3State createState() => _Delay3State();
}

class _Delay3State extends State<Delay3> {
  TextEditingController searchController = TextEditingController();

  // Original list of DelayContainer3 items
  final List<DelayContainer3> duplicateItems = [
    DelayContainer3(NavClass: () => Delay4(), personName: "Malak Mohamed",),
    DelayContainer3(NavClass: () => Delay4(), personName: "Salma Ayman",),
    DelayContainer3(NavClass: () => Delay4(), personName: "Salma Ayman"),
  ];

  // List to display filtered results
  List<DelayContainer3> items = [];

  @override
  void initState() {
    items = List.from(duplicateItems); // Initialize with all items
    super.initState();
  }

  void filterSearchResults(String query) {
    setState(() {
      items = duplicateItems.where((item) {
        final personMatch = item.personName != null &&
            item.personName!.toLowerCase().contains(query.toLowerCase());
        return personMatch;
      }).toList();
    });
  }

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
        title: Center(
            child: Text(
                AppLocalizations.of(context)!.late,
          style: provider.isDark()
              ? MyTheme.darkTheme.textTheme.titleLarge
              : MyTheme.lightTheme.textTheme.titleLarge,
        )),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterSearchResults(value);
              },
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.search,
                  hintStyle: provider.isDark()
                  ? MyTheme.lightTheme.textTheme.bodyLarge
                  : MyTheme.darkTheme.textTheme.bodyLarge,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),filled: true,
                fillColor:MyTheme.romady
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return items[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DelayContainer3 extends StatelessWidget {
  final String? personName;
  final Widget Function()? NavClass;

  DelayContainer3( {required this.NavClass,this.personName,});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          border: Border.all(
              color: provider.isDark() ? MyTheme.romady : MyTheme.kohli,
              width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.permissionForDelay(personName ?? ''),

              style: provider.isDark()
                  ? MyTheme.darkTheme.textTheme.bodyLarge
                  : MyTheme.lightTheme.textTheme.bodyLarge,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      height: 50,
                      width: 110,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavClass!()));
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:provider.isDark()?MyTheme.romady:MyTheme.kohli,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.more,
                          style: provider.isDark()
                              ? MyTheme.lightTheme.textTheme.bodyLarge
                              : MyTheme.darkTheme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
