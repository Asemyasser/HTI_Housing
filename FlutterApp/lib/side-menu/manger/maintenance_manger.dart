import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../AppTheme.dart';
import '../../../setting_details/setting_provider.dart';
import '../supervisor/maintenanceRequests/Maintenance3.dart';

class MaintenanceManger2 extends StatefulWidget {
  @override
  State<MaintenanceManger2> createState() => _Maintenance2State();
}

class _Maintenance2State extends State<MaintenanceManger2> {
  bool isElectricalChecked = false;

  bool isPlumbingChecked = false;

  bool isAirConditioningChecked = false;

  bool isOtherChecked = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _floorController = TextEditingController();

  final TextEditingController _apartmentRoomController =
  TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

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
              AppLocalizations.of(context)!.maintenanceRequestTitle,
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
          child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      color: MyTheme.kohli,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SvgPicture.asset(
                          "assets/image/maintenance.svg",
                          width: 100,
                          height: 100,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    buildInputField(AppLocalizations.of(context)!.building, "------", _nameController, ""),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                AppLocalizations.of(context)!.typeofmaintenance,
                                style: provider.isDark()
                                    ? MyTheme.darkTheme.textTheme.bodyMedium
                                    : MyTheme.lightTheme.textTheme.bodyMedium
                            ),
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
                    buildInputField(AppLocalizations.of(context)!.descriptionIssue,
                        "", _floorController, " "), ////////
                    SizedBox(height: 16),
                   ]))
      )
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
          child: Text('Sent Successfully'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
