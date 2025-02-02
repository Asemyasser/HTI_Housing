import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CompleteData extends StatelessWidget {
  final Color buttonColor2;
  final Color boredrColor2;
  final String buttonText2;
  final Color? buttonColor;
  final String? buttontext;
  final TextStyle textStyle;
  final TextStyle buttonstyle;
  final Widget Function()? navigateToScreen;

  CompleteData({
    required this.buttonstyle,
    required this.textStyle,
    required this.buttonColor2,
    required this.boredrColor2,
    required this.buttonText2,
    this.buttonColor,
    this.buttontext,
    this.navigateToScreen,
  });

  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _capturedImage;

  Future<void> _captureImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
      );

      if (pickedFile != null) {
        _capturedImage = File(pickedFile.path);
      }
    } catch (e) {
      print("Error capturing image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 10),
          buildInputField(AppLocalizations.of(context)!.fullname,
              AppLocalizations.of(context)!.enteryourname, context),
          buildInputField(
              AppLocalizations.of(context)!.fathernumber, "+20|010**", context),
          buildInputField(
              AppLocalizations.of(context)!.mothernumber, "+20|010**", context),
          buildInputField(
              AppLocalizations.of(context)!.nationalid, "", context),
          SizedBox(height: 16),
           Row(
             children: [
               Text(
                  AppLocalizations.of(context)!.uploadid,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
             ],
           ),

          Column(
            children: [
              if (_capturedImage != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.file(
                    _capturedImage!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await _captureImage();
                      if (_capturedImage != null) {
                        (context as Element).markNeedsBuild();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor2,
                    ),
                    child: Text(
                      buttonText2,
                      style: textStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              width: 250,
              child: MaterialButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => navigateToScreen!(),
                      ),
                    );
                  }
                },
                height: 56,
                color: buttonColor ?? Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    buttontext ?? AppLocalizations.of(context)!.submit,
                    style: buttonstyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(String label, String hint, BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(label,
              style: provider.isDark()
                  ? MyTheme.darkTheme.textTheme.bodyLarge
                  : MyTheme.lightTheme.textTheme.bodyLarge),
          SizedBox(height: 5),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your $label'; // Error message
              }
              return null; // Validation successful
            },
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOutlinedButton({
    required String text,
    required Color backgroundColor,
    required Color borderColor,
    required TextStyle textStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: OutlinedButton(
        onPressed: () {},
        child: Text(
          text,
          style: textStyle,
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(color: borderColor, width: 1),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
