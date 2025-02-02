import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';

class Available_Recognized extends StatelessWidget {
  final Widget firstPage;
  final Widget secondPage;

  const Available_Recognized({
    Key? key,
    required this.firstPage,
    required this.secondPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Column(
      children: [
        Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => firstPage),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 194,
              width: 220,
              decoration: BoxDecoration(
                color: provider.isDark() ? MyTheme.romady : MyTheme.kohli,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(AppLocalizations.of(context)!.availableroom,
                  style: provider.isDark()
                      ? MyTheme.lightTheme.textTheme.bodyLarge
                      : MyTheme.darkTheme.textTheme.bodyLarge),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => secondPage),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 194,
              width: 220,
              decoration: BoxDecoration(
                color: MyTheme.pinkColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                AppLocalizations.of(context)!.recognized,
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.darkTheme.textTheme.bodyLarge,
              ),
            ),
          ),
        )
      ],
    );
  }
}
