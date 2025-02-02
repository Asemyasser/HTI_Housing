import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradproject/sakn%20details/supervisor_details_of_building_/build_recognized/normalRecognized/normal_recognized.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../notification/supervisor.dart';
import '../../sakn details/supervisor_details_of_building_/builds_available_room/normal_AvaliableRoom/normal_available_room.dart';
import '../../setting_details/setting_provider.dart';
import '../../side-menu/type_sidemenu/female_supervisor.dart';
import 'available&recognized.dart';

class AlnormalView extends StatefulWidget {
  const AlnormalView({super.key});

  @override
  State<AlnormalView> createState() => _AlnormalViewState();
}

class _AlnormalViewState extends State<AlnormalView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Scaffold(
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2A4D),
        title: Center(child: Text(AppLocalizations.of(context)!.normal)),
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
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Available_Recognized(
              firstPage: NormalAvailableRoom(), secondPage: normalRecognized())
        ],
      ),
    );
  }
}
