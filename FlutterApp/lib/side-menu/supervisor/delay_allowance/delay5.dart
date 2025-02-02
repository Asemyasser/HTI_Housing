import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class delay5 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Color(0xFF1A2A4D),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // مسافة مناسبة من اليمين واليسار
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/image/backIcon.svg',
                width: 24.0, // زيادة الأبعاد لجعل الأيقونة أسهل في النقر
                height: 24.0,
                color: Colors.white,
              ),
            ),
          ),
          leadingWidth: 56.0, // التأكد من أن العرض مناسب للأيقونة
          centerTitle: true,
          title: Text(
              AppLocalizations.of(context)!.late,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            children: [SizedBox(height: 180,),
              Container(height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/hand-drawn-no-data-illustration_23-2150696461-removebg-preview 1.png")),
                ),
              ),SizedBox(height: 20,),
              Text(
                AppLocalizations.of(context)!.noPermissions,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

              ),

            ],
          ),
        ));
  }
}
