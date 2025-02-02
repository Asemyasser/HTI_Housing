import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../AppTheme.dart';
import '../../../setting_details/setting_provider.dart';
import 'Maintenance3.dart';

class Maintenance2 extends StatefulWidget {
  @override
  State<Maintenance2> createState() => _Maintenance2State();
}

class _Maintenance2State extends State<Maintenance2> {
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
              AppLocalizations.of(context)!.request,
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
        centerTitle: true,    ),
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
                  width: 10,
                  height: 10,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              buildInputField(AppLocalizations.of(context)!.studentname, "------",
                  _nameController, ""),
              buildInputField(AppLocalizations.of(context)!.floornumber, "-----", _floorController,""
                  ),
              buildInputField(
                  AppLocalizations.of(context)!.apartmentRoomLabel,
                  "",
                  _apartmentRoomController,
                  ""),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.typeofmaintenance,
                        style: provider.isDark()
                            ? MyTheme.darkTheme.textTheme.bodyLarge
                            : MyTheme.lightTheme.textTheme.bodyLarge),
                    CheckboxListTile(
                      title: Text(
                        AppLocalizations.of(context)!.electricalLabel,
                        style: provider.isDark()
                            ? MyTheme.darkTheme.textTheme.bodyMedium
                            : MyTheme.lightTheme.textTheme.bodyMedium,
                      ),
                      value: isElectricalChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isElectricalChecked = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor:
                          provider.isDark() ? MyTheme.romady : MyTheme.kohli,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    ),
                    CheckboxListTile(
                      title: Text(AppLocalizations.of(context)!.plumbing,
                          style: provider.isDark()
                              ? MyTheme.darkTheme.textTheme.bodyMedium
                              : MyTheme.lightTheme.textTheme.bodyMedium),
                      value: isPlumbingChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isPlumbingChecked = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor:
                          provider.isDark() ? MyTheme.romady : MyTheme.kohli,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    ),
                    CheckboxListTile(
                      title: Text(AppLocalizations.of(context)!.airConditioningLabel,
                          style: provider.isDark()
                              ? MyTheme.darkTheme.textTheme.bodyMedium
                              : MyTheme.lightTheme.textTheme.bodyMedium),
                      value: isAirConditioningChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isAirConditioningChecked = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor:provider.isDark() ? MyTheme.romady : MyTheme.kohli,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    ),
                    CheckboxListTile(
                      title: Text(AppLocalizations.of(context)!.other,
                          style: provider.isDark()
                              ? MyTheme.darkTheme.textTheme.bodyLarge
                              : MyTheme.lightTheme.textTheme.bodyLarge),
                      value: isOtherChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isOtherChecked = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: provider.isDark() ? MyTheme.romady : MyTheme.kohli,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              buildInputField(AppLocalizations.of(context)!.descriptionIssue, AppLocalizations.of(context)!.description,
                  _descriptionController, ""),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 156,
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _showSuccessDialog(context);
                          Navigator.push(
                              context, Maintenance3() as Route<Object?>);
                        }
                      },
                      height: 56,
                      color:provider.isDark()?MyTheme.romady:MyTheme.kohli,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(AppLocalizations.of(context)!.sendManager,
                            style: provider.isDark()
                                ? MyTheme.lightTheme.textTheme.titleSmall
                                : MyTheme.darkTheme.textTheme.titleSmall),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, String hint,
      TextEditingController controller, String? validationMessage) {
    var provider = Provider.of<SettingProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(label,
              style: provider.isDark()
                  ? MyTheme.darkTheme.textTheme.bodyMedium
                  : MyTheme.lightTheme.textTheme.bodyMedium),
          SizedBox(height: 10),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: provider.isDark()
                  ? MyTheme.lightTheme.textTheme.bodyMedium
                  : MyTheme.lightTheme.textTheme.bodyMedium,
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
