import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../profile-screens/screens/changepassword-page.dart';
import '../../profile-screens/screens/edit-profile.dart';
import '../../setting_details/setting_provider.dart';
import '../../profile-screens/screens/help-center-page.dart';
import '../../profile-screens/screens/privacy-policy-page.dart';
import '../../profile-screens/screens/settings-page.dart';
import '../../signup_login/login.dart';

class Profile_Superviser extends StatelessWidget {
  const Profile_Superviser({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Scaffold(
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,
      body: Column(
        children: [
          // Profile Picture and Name
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/image/saknDetails/image.png'), // Replace with actual image asset
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Divider(),
          // Menu Items
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(context, 'assets/image/profile/user-profile.svg', AppLocalizations.of(context)!.editProfile, EditProfilePage(),iconSize: 20.0,),

                _buildMenuItem(context, 'assets/image/profile/password.svg', AppLocalizations.of(context)!.changePassword, ChangePasswordBottomSheet()),

                _buildMenuItem(context, 'assets/image/profile/settings.svg', AppLocalizations.of(context)!.settings, SettingsPage(),),
                _buildMenuItem(context, 'assets/image/profile/privacy.svg', AppLocalizations.of(context)!.privacyPolicy, PrivacyPolicyPage(),),

                _buildMenuItem(
                  context,
                  'assets/image/profile/pepicons-pop_leave.svg',
                  AppLocalizations.of(context)!.logOut,
                  Login(),
                  iconSize: 24.0, // تمرير الحجم كمعامل اختياري
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String iconPath, String text, Widget destinationPage, {double iconSize = 20.0}) {
    var provider = Provider.of<SettingProvider>(context);
    return ListTile(
      leading: SvgPicture.asset(
        iconPath,
        width: iconSize, // استخدام الحجم المُمرر
        height: iconSize,color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor
      ),
      title: Text(
        text,
        style: provider.isDark()
            ? MyTheme.darkTheme.textTheme.titleSmall
            : MyTheme.lightTheme.textTheme.titleSmall,
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: MyTheme.romadyIconColor),
      onTap: () {
        // Navigate to the selected page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
    );
  }
}
