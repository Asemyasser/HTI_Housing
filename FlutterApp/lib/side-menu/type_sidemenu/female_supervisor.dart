import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';
import '../student/about.dart';
import '../student/access-route.dart';
import '../student/housing-manager.dart';
import '../supervisor/delay_allowance/delay1.dart';
import '../supervisor/holiday_exit/holiday2.dart';
import '../supervisor/maintenanceRequests/Maintenance1.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../supervisor/studentWarning.dart';

class SupervisorDrawer extends StatelessWidget {

  Widget build(BuildContext context) {  var provider = Provider.of<SettingProvider>(context);
    return Drawer(backgroundColor:
      provider.isDark()
        ? MyTheme.darkTheme.scaffoldBackgroundColor
        : MyTheme.lightTheme.scaffoldBackgroundColor,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: provider.isDark() ? MyTheme.kohli : MyTheme.kohli,
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: provider.isDark() ? MyTheme.kohli : Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                    child: ClipRRect(
                  child: Image.asset(
                  "assets/image/hti.png",
                  width: 70,
                  height: 70,
                  ),
                  ),
                ),
                SizedBox(
                    width:
                    20),
                Text(
                  "HTI Housing",
                  style: TextStyle(
                      fontFamily: 'Itim',
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/image/slideMenue/DelayIcon.svg',color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor,),
            title: Text(
                AppLocalizations.of(context)!.late,
                style:provider.isDark()?MyTheme.darkTheme.textTheme.bodyLarge:MyTheme.lightTheme.textTheme.bodyLarge),

            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Delay1()));
            },
          ),
          ListTile(
            leading:
            SvgPicture.asset('assets/image/slideMenue/HolidayIcon.svg',color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor),
            title: Text(
                AppLocalizations.of(context)!.allow,
                style:provider.isDark()?MyTheme.darkTheme.textTheme.bodyLarge:MyTheme.lightTheme.textTheme.bodyLarge),

            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Holiday2(personName: 'Salma Ibrahim'))
              );
            },
          ),
          ListTile(
            leading:
            SvgPicture.asset('assets/image/slideMenue/warningIcon.svg',color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor),
            title: Text(
                AppLocalizations.of(context)!.stuwarning,
                style:provider.isDark()?MyTheme.darkTheme.textTheme.bodyLarge:MyTheme.lightTheme.textTheme.bodyLarge),

            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentWarning()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset('assets/image/maintenance.svg',width: 25,height: 25,color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor),
            title: Text(
                AppLocalizations.of(context)!.request,
                style:provider.isDark()?MyTheme.darkTheme.textTheme.bodyLarge:MyTheme.lightTheme.textTheme.bodyLarge),

            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Maintenance1()));
            },
          ),
          ListTile(
            leading:
            SvgPicture.asset('assets/image/slideMenue/locationIcon.svg',color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor),
            title: Text(AppLocalizations.of(context)!.accross,
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.lightTheme.textTheme.bodyLarge),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Accessroute()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
                'assets/image/slideMenue/HousingManagerIcon.svg',color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor),
            title: Text(AppLocalizations.of(context)!.manger,
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.lightTheme.textTheme.bodyLarge),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HousingManager()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset('assets/image/slideMenue/aboutIcon.svg',color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor),
            title: Text(AppLocalizations.of(context)!.about,
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.lightTheme.textTheme.bodyLarge),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
          ),
        ],
      ),
    );
  }
}


