import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradproject/sakn%20details/supervisor_details_of_building_/build_recognized/al62_recognized.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../notification/supervisor.dart';
import '../../sakn details/supervisor_details_of_building_/builds_available_room/al62_availableRoom.dart';
import '../../setting_details/setting_provider.dart';
import '../../side-menu/type_sidemenu/female_supervisor.dart';
import 'available&recognized.dart';


class Al62View extends StatefulWidget {
  const Al62View({super.key});

  @override
  State<Al62View> createState() => _Al62ViewState();
}

class _Al62ViewState extends State<Al62View> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(backgroundColor: provider.isDark()
        ? MyTheme.darkTheme.scaffoldBackgroundColor
        : MyTheme.lightTheme.scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor:provider.isDark()
            ? MyTheme.darkTheme.appBarTheme.backgroundColor
            : MyTheme.lightTheme.appBarTheme.backgroundColor,
        title: Center(child: Text(AppLocalizations.of(context)!.al62,
          style: provider.isDark()
            ? MyTheme.darkTheme.textTheme.titleLarge
            : MyTheme.lightTheme.textTheme.titleLarge,)),
        leading: IconButton(
          icon: Icon(Icons.menu,color:Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon:SvgPicture.asset(
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
      drawer: SupervisorDrawer(

      ),
      body: Column(
        children: [
          SizedBox(height: 150,),
          Available_Recognized(firstPage: Al62AvaliableRoom(), secondPage: Al62Recognized())
        ],
      ),
    );
  }
}
