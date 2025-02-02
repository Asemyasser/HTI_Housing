import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(backgroundColor: provider.isDark()
        ? MyTheme.darkTheme.scaffoldBackgroundColor
        : MyTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2A4D),
        title: Center(child: Text(AppLocalizations.of(context)!.editProfile ,style: TextStyle(color: Colors.white))),

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
      ),
      body: SingleChildScrollView(
        child: Column(
        children:[
          SizedBox(height: 30,),
        Center(
          child:
          Stack(
            children: [ClipRRect(
              child: Image.asset(
                "assets/image/saknDetails/image.png",
                width: 125,
                height: 125,
              ),

            ),
              Positioned(
                top:90,
                left: 90,
                child: Stack(
                  children: [Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), // جعل الحواف مستديرة
                      color: Colors.white,

                    ),

                    child: Icon(Icons.edit,
                      size: 20.0,
                    ),
                  ),
               ] ),
              ),
              // Positioned(
              //   height: 200,
              //   width: 200,
              //   child: ImageIcon(
              //     AssetImage('assets/profile/ic_round-edit.png',),
              //     size: 20.0,
              //   //color: Colors.white,
              //   ),
              // ),
         ] ),

        ),SizedBox(height: 50,),
          buildInputField(context,AppLocalizations.of(context)!.name,
              AppLocalizations.of(context)!.studentNameHint),
          SizedBox(
            height: 20,
          ),
          buildInputField(context,
              AppLocalizations.of(context)!.number, "+20 | 01*********"),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            child: Container(
              width: 250, //argin: EdgeInsets.only(left: 70, right: 70),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(),
                    ),
                  );
                },
                height: 56,
                color: provider.isDark()?MyTheme.romady:MyTheme.kohli,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                      AppLocalizations.of(context)!.editProfile,
                      style: provider.isDark()?MyTheme.lightTheme.textTheme.titleSmall:MyTheme.darkTheme.textTheme.titleSmall
                  ),
                ),
              ),
            ),
          ),
        ]),
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
                style: provider.isDark()?MyTheme.darkTheme.textTheme.bodyMedium:MyTheme.lightTheme.textTheme.bodyMedium
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
