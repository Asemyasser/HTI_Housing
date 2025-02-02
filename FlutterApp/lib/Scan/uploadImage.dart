import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../AppTheme.dart';
import '../setting_details/setting_provider.dart';
import 'ReviewSummery.dart';

class ImageUpload extends StatefulWidget {
  static const String routeName = '/ImageUpload';

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? image;

  Future<void> pickImageGallery() async {
    try {
      final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          image = File(pickedImage.path);
        });
        _navigateToNextScreen(); // الانتقال للشاشة التالية
      } else {
        print("No image selected");
      }
    } catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Future<void> pickImageCamera() async {
    try {
      final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        setState(() {
          image = File(pickedImage.path);
        });
        _navigateToNextScreen(); // الانتقال للشاشة التالية
      } else {
        print("No image selected");
      }
    } catch (e) {
      print("Failed to pick image: $e");
    }
  }

  void _navigateToNextScreen() {
    Submet(); // عرض رسالة النجاح
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReviewSummary()),
      );
    });
  }

  void Submet() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/image/done.png"),
            SizedBox(height: 10),
            Text("Payment receipt scanned successfully"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.kohli,
        title: Center(
            child: Text(
              AppLocalizations.of(context)!.bookRoom,
              style: provider.isDark()
                  ? MyTheme.darkTheme.textTheme.titleLarge
                  : MyTheme.lightTheme.textTheme.titleLarge,
            )),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/image/backIcon.svg',
              width: 24.0,
              height: 24.0,
              color: Colors.white,
            ),
          ),
        ),
        leadingWidth: 56.0,
        centerTitle: true,
      ),
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0, left: 20),
              child: Text(
                  "Click the button to upload the payment receipt image",
                  style:provider.isDark()?MyTheme.darkTheme.textTheme.bodyLarge:MyTheme.lightTheme.textTheme.bodyLarge
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                'assets/image/sakn/ep_upload-filled.svg',
                width: 100.0,
                height: 100.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: pickImageGallery,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A2A4D),
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Upload from gallery",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickImageCamera,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A2A4D),
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Upload from camera",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
