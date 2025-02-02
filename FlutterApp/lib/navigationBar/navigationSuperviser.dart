import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../setting_details/setting_provider.dart';

class CustomNavigationBarSuperviser extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomNavigationBarSuperviser({
    required this.currentIndex,
    required this.onTap,
  });

  // Helper function to build a navigation item
  Widget buildNavItem({
    required String svgPath,
    required String label,
    required int index,
    required int currentIndex,
    required bool isDark,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgPath,
          width: 20,
          height: 20,
          color: isDark
              ? Colors.white // All icons white in dark mode
              : (index == currentIndex ? MyTheme.kohli : Colors.grey),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: isDark
                ? Colors.white // All text white in dark mode
                : (index == currentIndex ? MyTheme.kohli : Colors.grey),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return CurvedNavigationBar(
      index: currentIndex,
      height: 75.0,
      color: provider.isDark() ? MyTheme.kohli : Colors.white,
      backgroundColor:
      provider.isDark() ? MyTheme.romady : Colors.grey.shade200,
      buttonBackgroundColor:
      provider.isDark() ? MyTheme.kohli : Colors.white,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: onTap,
      items: [
        buildNavItem(
          svgPath: "assets/image/navBar/homeIcon.svg",
          label: AppLocalizations.of(context)?.home ?? 'Home',
          index: 0,
          currentIndex: currentIndex,
          isDark: provider.isDark(),
        ),
        buildNavItem(
          svgPath: "assets/image/navBar/rules.svg",
          label: AppLocalizations.of(context)?.rules ?? 'Rules',
          index: 1,
          currentIndex: currentIndex,
          isDark: provider.isDark(),
        ),
        buildNavItem(
          svgPath: "assets/image/navBar/busIcon.svg",
          label: AppLocalizations.of(context)?.bustime ?? 'Bus Time',
          index: 2,
          currentIndex: currentIndex,
          isDark: provider.isDark(),
        ),
        buildNavItem(
          svgPath: "assets/image/navBar/profleIcon.svg",
          label: AppLocalizations.of(context)?.profile ?? 'Profile',
          index: 3,
          currentIndex: currentIndex,
          isDark: provider.isDark(),
        ),
      ],
    );
  }
}
