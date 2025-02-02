import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';
import '../../navigationBar/navigationSuperviser.dart';
import '../../notification/manager.dart';
import '../../setting_details/setting_provider.dart';
import '../../side-menu/type_sidemenu/manger_drawer.dart';
import '../../student_screen/bus_time_male.dart';
import '../../student_screen/malerules.dart';
import '../../student_screen/malerules.dart';
import '../monter_student/62_view.dart';
import '../monter_student/aldeifa_view.dart';
import '../monter_student/alnormal_view.dart';
import '../monter_student/safwa_view.dart';
import '../screens_manger/profile.dart';
import 'details_of_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AllBuilding extends StatefulWidget {
  const AllBuilding({super.key});

  @override
  State<AllBuilding> createState() => _AllBuildingState();
}

class _AllBuildingState extends State<AllBuilding> {
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
          icon: Icon(
            Icons.menu,
            color: Colors.white
          ),
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
                MaterialPageRoute(builder: (context) => NotifManager()),
              );
            },
          ),
        ],
      ),
      drawer: MangerDrawer(),
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
          BusTimeMale(),// صفحة ثانية
          // الصفحة الرئيسية لعرض المباني
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

  Widget buildHomePage(BuildContext context) {
    return Column(children: [
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppLocalizations.of(context)!.welcome,
                        style: TextStyle(
                          color: Color(0xFFEEA1B3),
                          fontSize: 32,
                          fontFamily: 'Itim',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              DetailsOfScreen(
                title: AppLocalizations.of(context)!.safwa,
                price: '5000 EGP',
                photo: 'assets/image/homeScreen/safwa.png',
                detalis_of_bulid: SafwaView(),
              ),
              DetailsOfScreen(
                title: AppLocalizations.of(context)!.normal,
                price: '3525 EGP Single',
                photo: 'assets/image/homeScreen/normal.png',
                detalis_of_bulid: AlnormalView(),
              ),
              DetailsOfScreen(
                title: AppLocalizations.of(context)!.diafa,
                price: '4170 EGP',
                photo: 'assets/image/homeScreen/diafa.png',
                detalis_of_bulid: AldeifaView(),
              ),
              DetailsOfScreen(
                title: AppLocalizations.of(context)!.al62,
                price: '2770 EGP',
                photo: 'assets/image/homeScreen/62.png',
                detalis_of_bulid:Al62View(),
              ),
            ],
          ),
        ),
      )
    ]);
  }

  // مثال على صفحة أخرى للتنقل
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
