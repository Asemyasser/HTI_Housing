import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradproject/student_screen/bus_time_male.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';
import '../../excelFile.dart';
import '../../navigationBar/navigationSuperviser.dart';
import '../../notification/supervisor.dart';
import '../../sakn details/supervisor_details_of_building_/build_recognized/normalRecognized/normal_recognized.dart';
import '../../sakn details/supervisor_details_of_building_/builds_available_room/normal_AvaliableRoom/normal_available_room.dart';
import '../../setting_details/setting_provider.dart';
import '../../side-menu/type_sidemenu/female_supervisor.dart';
import '../../student_screen/malerules.dart';
import '../monter_student/available&recognized.dart';
import '../screens_manger/profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AlNormal extends StatefulWidget {
  const AlNormal({super.key});

  @override
  State<AlNormal> createState() => _AlNormalState();
}

class _AlNormalState extends State<AlNormal> {
  int _currentIndex = 0;
  PageController _pageController = PageController(); // للتحكم في PageView
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: provider.isDark()
            ? MyTheme.darkTheme.appBarTheme.backgroundColor
            : MyTheme.lightTheme.appBarTheme.backgroundColor,
        title: Center(
            child: Text(
          _getAppBarTitle(),
          style: provider.isDark()
              ? MyTheme.darkTheme.textTheme.titleLarge
              : MyTheme.lightTheme.textTheme.titleLarge,
        )),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/image/homeScreen/Vector (2).svg', // مسار الصورة الثانية
              width: 20,
              height: 22,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotfSupuervisor()),
              );
            },
          ),
        ],
      ),
      drawer: SupervisorDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          buildHomePage(context), // الصفحة الرئيسية لعرض المباني
          maleRules(),
          BusTimeMale(), // صفحة البروف
          Profile_Superviser(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBarSuperviser(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
    );
  }
  String _getAppBarTitle() {
    switch (_currentIndex) {
      case 1:
        return AppLocalizations.of(context)!.rules;
      case 2:
        return AppLocalizations.of(context)!.bustime;
      case 3:
        return AppLocalizations.of(context)!.profile;
      default:
        return AppLocalizations.of(context)!.home; // العنوان الافتراضي
    }
  }


  // الصفحة الرئيسية لعرض المباني
  Widget buildHomePage(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Column(children: [
      Expanded(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Row(
              children: [
                SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context)!.welcome,
                  style: TextStyle(
                    color: Color(0xFFEEA1B3),
                    fontSize: 32,
                    fontFamily: 'Itim',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.normal_building,
                  style: provider.isDark()
                      ? MyTheme.darkTheme.textTheme.bodyMedium
                      : MyTheme.lightTheme.textTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Available_Recognized(
                firstPage: NormalAvailableRoom(), secondPage: normalRecognized()),
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                color: provider.isDark()
                    ? MyTheme.romadyIconColor
                    : MyTheme.KohliIconColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              margin: const EdgeInsets.only(left: 300),
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/image/homeScreen/tracking.svg', // Path to the second image
                  width: 20,
                  height: 22,
                  color: provider.isDark()
                      ? MyTheme.KohliIconColor
                      : MyTheme.romadyIconColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Excel(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ]),
        )),
      )
    ]);
  }
}
