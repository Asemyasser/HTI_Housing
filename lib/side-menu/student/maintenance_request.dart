import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../AppTheme.dart';
import '../../homescreen/home_female.dart';
import '../../homescreen/home_male.dart';
import '../../setting_details/setting_provider.dart';


class MaintenanceRequest extends StatefulWidget {
  @override
  final int? index;
  MaintenanceRequest({this.index});
  State<MaintenanceRequest> createState() => _MaintenanceRequestState();
}

class _MaintenanceRequestState extends State<MaintenanceRequest> {
  late final Widget Function()? routeClass;
  bool isElectricalChecked = false;
  bool isPlumbingChecked = false;
  bool isAirConditioningChecked = false;
  bool isOtherChecked = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _apartmentRoomController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: MyTheme.kohli,
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
                  padding: const EdgeInsets.all(50.0),
                  child: SvgPicture.asset(
                    "assets/image/maintenance.svg",
                    width: 50,
                    height: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              buildInputField(
                  AppLocalizations.of(context)!.studentname,
                  AppLocalizations.of(context)!.studentNameHint,
                  _nameController,
                  AppLocalizations.of(context)!.studentNameLabel),
              buildInputField(
                  AppLocalizations.of(context)!.floornumber,
                  AppLocalizations.of(context)!.floorNumberHint,
                  _floorController,
                  AppLocalizations.of(context)!.floorNumberLabel),
              buildInputField(
                  AppLocalizations.of(context)!.apartment,
                  AppLocalizations.of(context)!.apartmentRoomHint,
                  _apartmentRoomController,
                  AppLocalizations.of(context)!.apartmentRoomLabel),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.typeofmaintenance,
                        style: provider.isDark()
                            ? MyTheme.darkTheme.textTheme.bodyMedium
                            : MyTheme.lightTheme.textTheme.bodyMedium),
                    CheckboxListTile(
                      title: Text(AppLocalizations.of(context)!.electrical,
                          style: provider.isDark()
                              ? MyTheme.darkTheme.textTheme.bodyMedium
                              : MyTheme.lightTheme.textTheme.bodyMedium),
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
                      title: Text(AppLocalizations.of(context)!.airconditioning,
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
                      activeColor: Color(0xFF1A2A4D),
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    ),
                    CheckboxListTile(
                      title: Text(
                        AppLocalizations.of(context)!.other,
                        style: provider.isDark()
                            ? MyTheme.darkTheme.textTheme.bodyMedium
                            : MyTheme.lightTheme.textTheme.bodyMedium,
                      ),
                      value: isOtherChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isOtherChecked = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor:
                      provider.isDark() ? MyTheme.romady : MyTheme.kohli,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              buildInputField(
                  AppLocalizations.of(context)!.descriptionIssue,
                  AppLocalizations.of(context)!.description,
                  _descriptionController,
                  "Please describe the issue"),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 156,
                    child: MaterialButton(
                      onPressed: () {

                        if (widget.index == 11) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomemaleStudent()),
                          );
                        } else if (widget.index == 22) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeFemaleStudent()),
                          );
                        } else {
                          // Default behavior if index is null or not matched
                          Navigator.pop(context); // Simply pop the current page
                        }
                      },

                      height: 56,
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.cancel,
                          style: MyTheme.buttonText,
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
                      color: provider.isDark() ? MyTheme.romady : MyTheme.kohli,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.submit,
                          style: provider.isDark()?MyTheme.lightTheme.textTheme.titleSmall:MyTheme.buttonText,
                        ),
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
          Text(
            label,
            style: provider.isDark()
                ? MyTheme.darkTheme.textTheme.bodyMedium
                : MyTheme.lightTheme.textTheme.bodyMedium,
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: provider.isDark()
                  ? MyTheme.darkTheme.textTheme.bodyMedium
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

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Icon(Icons.error, color: Color(0xFFCF0202), size: 60),
          ),
          content: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(AppLocalizations.of(context)!.error),
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
}
