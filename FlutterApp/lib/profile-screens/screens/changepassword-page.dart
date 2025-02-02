import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../setting_details/bottomtheme.dart';
import '../../setting_details/setting_provider.dart';

class ChangePasswordBottomSheet extends StatelessWidget {
  const ChangePasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2A4D),
        title:
            Center(child: Text(AppLocalizations.of(context)!.changePassword, style: TextStyle(color: Colors.white))),

        leading: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // مسافة مناسبة من اليمين واليسار
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/image/backIcon.svg',
              width: 24.0, // زيادة ال أبعاد لجعل الأيقونة أسهل في النقر
              height: 24.0,
              color: Colors.white,
            ),
          ),
        ),
        leadingWidth: 56.0, // التأكد من أن العرض مناسب للأيقونة
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
            ),
            buildInputField(context,AppLocalizations.of(context)!.currentpass, "*********",),
            SizedBox(
              height: 20,
            ),
            buildInputField(context,AppLocalizations.of(context)!.newpass, "*********",),
            buildInputField(context,AppLocalizations.of(context)!.confirmnewpass, "*********",),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              child: Container(
                width: 250, //argin: EdgeInsets.only(left: 70, right: 70),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  height: 56,
                  color: Color(0xFF1A2A4D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.savechange,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildInputField(BuildContext context,String label, String hint, {Widget? suffixIcon}) {
    var provider = Provider.of<SettingProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Text(
              label,
              style:provider.isDark()?MyTheme.darkTheme.textTheme.bodyMedium:MyTheme.lightTheme.textTheme.bodyMedium,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          height: 61,
          width: 343,
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
