import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';

class DetailsOfScreen extends StatelessWidget {
  final String title;
  final String price;
  final String photo;
  final Widget detalis_of_bulid;

  const DetailsOfScreen({
    Key? key,
    required this.title,
    required this.price,
    required this.photo,
    required this.detalis_of_bulid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10),
      child: Container(
        width: 400,
        height: 300,
        decoration: BoxDecoration(
          color:provider.isDark()?MyTheme.kohli: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color:provider.isDark()?Color(0xFF2B447B):Colors.grey.shade100,
                    blurRadius: 20,
                    offset: Offset(0, 10))
              ]

        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                 30
              ),
              child: Image.asset(
                photo,
                width: 400,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: provider.isDark()
                            ? MyTheme.darkTheme.textTheme.bodyMedium
                            : MyTheme.lightTheme.textTheme.bodyMedium
                      ),
                      Text(
                        price,
                        style:  provider.isDark()
                            ? MyTheme.darkTheme.textTheme.bodySmall
                            : MyTheme.lightTheme.textTheme.bodySmall
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => detalis_of_bulid), // استخدم المتغير مباشرة
                      );
                    },
                    height: 40,
                    color:provider.isDark()?Colors.white:MyTheme.kohli,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.more,
                      style: TextStyle(
                        color: provider.isDark()?MyTheme.kohli:Colors.white,
                        fontWeight: FontWeight.bold,
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
