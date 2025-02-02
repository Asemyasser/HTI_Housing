import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../AppTheme.dart';
import '../../../setting_details/setting_provider.dart';
import '../holiday_exit/holiday1.dart';
class Maintenance3 extends StatefulWidget {
  @override
  State<Maintenance3> createState() => _Maintenance3State();
}

class _Maintenance3State extends State<Maintenance3> {
  bool isElectricalChecked = false;

  bool isPlumbingChecked = false;

  bool isAirConditioningChecked = false;

  bool isOtherChecked = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _floorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Scaffold(backgroundColor: provider.isDark()
        ? MyTheme.darkTheme.scaffoldBackgroundColor
        : MyTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: provider.isDark()
            ? MyTheme.darkTheme.appBarTheme.backgroundColor
            : MyTheme.lightTheme.appBarTheme.backgroundColor,
        title: Center(child: Text(AppLocalizations.of(context)!.request, style: provider.isDark()
            ? MyTheme.darkTheme.textTheme.titleLarge
            : MyTheme.lightTheme.textTheme.titleLarge,)),
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
        centerTitle: true,      ),
        body: SingleChildScrollView(
      child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
        width: double.infinity,
        height: 200,
        color: MyTheme.kohli,
        child: SvgPicture.asset(
          "assets/image/maintenance.svg",
          width: 100,
          height: 100,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 10),
      buildInputField(AppLocalizations.of(context)!.building, "Al-safwa", _nameController, "Please enter your Bulding"),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    AppLocalizations.of(context)!.typeofmaintenance,
                  style: provider.isDark()
                      ? MyTheme.darkTheme.textTheme.bodyMedium
                      : MyTheme.lightTheme.textTheme.bodyMedium
                ),
                CheckboxListTile(
                  title: Text(
                      AppLocalizations.of(context)!.electrical,
                    style: provider.isDark()
                        ? MyTheme.darkTheme.textTheme.bodyMedium
                        : MyTheme.lightTheme.textTheme.bodyMedium
                  ),
                  value: isElectricalChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isElectricalChecked = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor:provider.isDark()?MyTheme.romady:MyTheme.kohli,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                ),
                CheckboxListTile(
                  title: Text(
                      AppLocalizations.of(context)!.plumbing,
                     style: provider.isDark()
                          ? MyTheme.darkTheme.textTheme.bodyMedium
                          : MyTheme.lightTheme.textTheme.bodyMedium
                  ),
                  value: isPlumbingChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isPlumbingChecked = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor:provider.isDark()?MyTheme.romady:MyTheme.kohli,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                ),
                CheckboxListTile(
                  title: Text(
                      AppLocalizations.of(context)!.airConditioningLabel,
                    style:provider.isDark()
                        ? MyTheme.darkTheme.textTheme.bodyMedium
                        : MyTheme.lightTheme.textTheme.bodyMedium
                  ),
                  value: isAirConditioningChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isAirConditioningChecked = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor:provider.isDark()?MyTheme.romady:MyTheme.kohli,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                ),
                CheckboxListTile(
                  title: Text(
                      AppLocalizations.of(context)!.other,
                    style: provider.isDark()
                        ? MyTheme.darkTheme.textTheme.bodyMedium
                        : MyTheme.lightTheme.textTheme.bodyMedium
                  ),
                  value: isOtherChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isOtherChecked = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: provider.isDark()?MyTheme.romady:MyTheme.kohli,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                ),
              ],
            ),
          ),
      buildInputField(AppLocalizations.of(context)!.descriptionIssue, AppLocalizations.of(context)!.description, _floorController, " "), ////////
      SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 156,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>HolidayOne()),
                  );
                },
                height: 56,
                color: Color(0xFFCD0A0A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                      AppLocalizations.of(context)!.cancel,
                    style:MyTheme.buttonText
                  ),
                ),
              ),
            ),
            SizedBox(width: 40),
            Container(
              width: 156,
              child: MaterialButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _showSuccessDialog(context);
                  }
                },
                height: 56,
                color: provider.isDark()?MyTheme.romady:MyTheme.kohli,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                      AppLocalizations.of(context)!.sendManager,
                    style: provider.isDark()
                        ? MyTheme.lightTheme.textTheme.titleSmall
                        : MyTheme.darkTheme.textTheme.titleSmall
                  ),
                ),
              ),
            ),
          ],
        ),]))
    )


    );

  }
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Icon(Icons.check_circle, color: Colors.green, size: 60),
          ),
          content: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(AppLocalizations.of(context)!.sentsuccessfully),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(AppLocalizations.of(context)!.ok),
            ),
          ],
        );
      },
    );
  }
  Widget buildInputField(String label, String hint, TextEditingController controller, String? validationMessage) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF1C2833),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return validationMessage;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
