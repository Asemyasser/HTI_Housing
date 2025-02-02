import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../setting_details/setting_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Delay2 extends StatefulWidget {
  const Delay2({super.key});

  @override
  State<Delay2> createState() => _Delay2State();
}

class _Delay2State extends State<Delay2> {
  // final _formKey = GlobalKey<FormState>(); // تعريف المفتاح للنموذج

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(
        backgroundColor: provider.isDark()
            ? MyTheme.darkTheme.scaffoldBackgroundColor
            : MyTheme.lightTheme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: provider.isDark()
              ? MyTheme.darkTheme.appBarTheme.backgroundColor
              : MyTheme.lightTheme.appBarTheme.backgroundColor,
          title: Center(
              child: Text(
                  AppLocalizations.of(context)!.late,
            style: provider.isDark()
                ? MyTheme.darkTheme.textTheme.titleLarge
                : MyTheme.lightTheme.textTheme.titleLarge,
          )),
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
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          AppLocalizations.of(context)!.delay2,
                          style: provider.isDark()
                              ? MyTheme.darkTheme.textTheme.bodyLarge
                              : MyTheme.lightTheme.textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      // إضافة خاصية التمرير الأفقي
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            rowbuildInputField(AppLocalizations.of(context)!.sunday,context),
                            rowbuildInputField( AppLocalizations.of(context)!.monday,context),
                            rowbuildInputField( AppLocalizations.of(context)!.friday,context),
                          ],
                        ),
                      ),
                      DelayImport()
                    ]))));
  }
}

class DelayImport extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Center(
      child: Form(
        key: _formKey, // إضافة المفتاح للنموذج
        child: Column(
         // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            buildInputField( AppLocalizations.of(context)!.fullname, AppLocalizations.of(context)!.enteryourname,context),
            buildInputField( AppLocalizations.of(context)!.fathernumber, "+20|010********",context),
            buildInputField(AppLocalizations.of(context)!.mothernumber, "+20|010********",context),
            buildInputField(AppLocalizations.of(context)!.nationalid, "**************",context),
            SizedBox(height: 16),
            Row(
              children: [

                    Text(
                        AppLocalizations.of(context)!.uploadid,
                        style: provider.isDark()
                            ? MyTheme.darkTheme.textTheme.bodyLarge
                            : MyTheme.lightTheme.textTheme.bodyLarge,

                    ),

                  ],
                ),
            SizedBox(height: 20,),

            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.open,
                    style: provider.isDark()
                        ? MyTheme.lightTheme.textTheme.titleSmall
                        : MyTheme.darkTheme.textTheme.titleSmall,
                    // لون النص أسود
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: provider.isDark()
                        ? MyTheme.romady
                        : MyTheme.kohli, // خلفية بيضاء

                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget buildInputField(String label, String hint,BuildContext context) {
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
              style:provider.isDark()
                  ? MyTheme.darkTheme.textTheme.bodyMedium
                  : MyTheme.lightTheme.textTheme.bodyMedium,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          height: 71,
          width: 343,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your $label'; // رسالة خطأ
              }
              return null; // التحقق ناجح
            },
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: provider.isDark()
    ? MyTheme.darkTheme.textTheme.bodyMedium
        : MyTheme.lightTheme.textTheme.bodyMedium,
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}


// دالة لبناء حقول الإدخال بشكل مرن
Widget rowbuildInputField(String hint,BuildContext context) {
  var provider = Provider.of<SettingProvider>(context);
  return Padding(
    padding: const EdgeInsets.only(right: 10.0), // تعديل المسافات
    child: Container(
      padding: EdgeInsets.all(5),
      height: 51,
      width: 110,
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: provider.isDark()
              ? MyTheme.darkTheme.textTheme.bodyMedium
              : MyTheme.lightTheme.textTheme.bodyMedium,
          border: OutlineInputBorder(),
        ),
      ),
    ),
  );
}

