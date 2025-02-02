import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../homescreen/details_of_screenhome/Al62.dart';
import '../homescreen/details_of_screenhome/al_diafa.dart';
import '../homescreen/details_of_screenhome/al_normal.dart';
import '../homescreen/details_of_screenhome/all.dart';
import '../homescreen/details_of_screenhome/safwa.dart';
import 'login.dart';

class SuperviseProfile extends StatefulWidget {
  @override
  State<SuperviseProfile> createState() => _SuperviseProfileState();
}

class _SuperviseProfileState extends State<SuperviseProfile> {
  String selectedBuilding = 'Al-Safwa';
  List<String> buildings = [
    'Al-Safwa',
    'Al-62',
    'Al-diafa',
    'Al-normal',
    "all"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // وضع الأيقونة في أعلى الصفحة
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 60),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                          context); // Go back to the previous screen on tap
                    },
                    child: SvgPicture.asset(
                      'assets/image/backIcon.svg',
                      width: 25.0,
                      height: 25.0,
                      color: Color(0XFF60636C), // Change to your desired color
                    ),
                  ),
                ],
              ),
            ),
            // باقي محتوى الصفحة
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  FadeInUp(
                    duration: Duration(milliseconds: 1400),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 15),
                      child: Text(
                        "Create Your Account",
                        style: TextStyle(
                          color: Color(0xFF1C2833),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  FadeInUp(
                    duration: Duration(milliseconds: 1400),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        buildInputField("Name", "Enter Your Name"),
                        buildInputField("Email", "Enter Your Email"),
                        buildDropdownField(),
                        buildInputField(
                          "Password",
                          "Enter Password",
                          suffixIcon: Icon(Icons.visibility),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        SizedBox(
                          child: Container(
                            width: 250,
                            child: MaterialButton(
                              onPressed: () {
                                // تحديد الصفحة بناءً على المبنى المحدد
                                Widget targetPage;
                                switch (selectedBuilding) {
                                  case 'Al-Safwa':
                                    targetPage =
                                        Safwa(); // تأكد من أن لديك هذه الصفحة
                                    break;
                                  case 'Al-62':
                                    targetPage =
                                        Al62(); // تأكد من أن لديك هذه الصفحة
                                    break;
                                  case 'Al-diafa':
                                    targetPage =
                                        AlDiafa(); // تأكد من أن لديك هذه الصفحة
                                    break;
                                  case 'Al-normal':
                                    targetPage =
                                        AlNormal(); // تأكد من أن لديك هذه الصفحة
                                    break;
                                  case 'all':
                                    targetPage =
                                        AllBuilding(); // تأكد من أن لديك هذه الصفحة
                                    break;
                                  default:
                                    targetPage =
                                        SuperviseProfile(); // في حالة عدم تطابق أي شيء، افتح الصفحة الرئيسية
                                }

                                // الانتقال إلى الصفحة المحددة
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => targetPage,
                                  ),
                                );
                              },
                              height: 56,
                              color: Color(0xFF1A2A4D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
                              },
                              child: Center(
                                child: Text(
                                  "Login..",
                                  style: TextStyle(
                                    color: Color(0xFFEEA1B3),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputField(String label, String hint, {Widget? suffixIcon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF1C2833),
                fontWeight: FontWeight.w500,
              ),
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

  Widget buildDropdownField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Text(
              "Building Name",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF1C2833),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          height: 61,
          width: 343,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: true, // يقلل من المساحة حول المحتوى
            ),
            isExpanded: true, // يسمح بعرض أفضل
            value: selectedBuilding,
            items: buildings.map((String building) {
              return DropdownMenuItem<String>(
                value: building,
                child: Text(
                  building,
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedBuilding = newValue!;
              });
            },
          ),
        ),
      ],
    );
  }
}
