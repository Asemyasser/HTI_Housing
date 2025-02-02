import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../navigationBar/navigationBar_student.dart';
import '../notification/student.dart';
import '../profile-screens/female_profile_student.dart';
import '../sakn details/Al_62/Al_62.dart';
import '../sakn details/alsafwa/elsafwaScreen.dart';
import '../setting_details/setting_provider.dart';
import '../side-menu/type_sidemenu/female_student_drawer.dart';
import '../student_screen/bus_times_female.dart';
import '../student_screen/femalerules.dart';
import '../student_screen/malerules.dart';
import 'details_of_screenhome/details_of_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// صف الصفحة الرئيسية لعرض المباني
class BuildHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(backgroundColor: provider.isDark()
        ? MyTheme.darkTheme.scaffoldBackgroundColor
        : MyTheme.lightTheme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
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
                    SizedBox(height: 10),
                   Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.builds,
                            style: provider.isDark()
                                ? MyTheme.darkTheme.textTheme.bodyLarge
                                : MyTheme.lightTheme.textTheme.bodyLarge,
                          ),
                        ],
                      ),

                    DetailsOfScreen(
                      title: AppLocalizations.of(context)!.safwa,
                      price: AppLocalizations.of(context)!.e,
                      photo: 'assets/image/homeScreen/safwa.png',
                      detalis_of_bulid: AlSafwaScreen(),
                    ),
                    DetailsOfScreen(
                      title: AppLocalizations.of(context)!.al62,
                      price: AppLocalizations.of(context)!.e,
                      photo: 'assets/image/homeScreen/62.png',
                      detalis_of_bulid: Al62Screen(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// صف الصفحة الرئيسية للطالبات
class HomeFemaleStudent extends StatefulWidget {
  @override
  State<HomeFemaleStudent> createState() => _HomeFemaleStudentState();
}

class _HomeFemaleStudentState extends State<HomeFemaleStudent> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

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
        backgroundColor: MyTheme.kohli,
        title: Center(
          child: Text(
            _getAppBarTitle(),
            style: provider.isDark()
                ? MyTheme.darkTheme.textTheme.titleLarge
                : MyTheme.lightTheme.textTheme.titleLarge,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/image/homeScreen/Vector (2).svg',
              width: 20,
              height: 22,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotfStudent()),
              );
            },
          ),
        ],
      ),
      drawer: StudentDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          // يمكنك الآن التنقل إلى BuildHomePage
          BuildHomePage(),
          FemaleRules(),
          BusTimeFemale(),
          FemaleProfileStudent(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBarStudent(
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
}
