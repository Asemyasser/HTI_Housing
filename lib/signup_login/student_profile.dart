import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradproject/signup_login/waiting.dart';

import 'login.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // وضع الأيقونة في أعلى الصفحة
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 60), // تعديل الحواف لتتناسب مع التصميم
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Go back to the previous screen on tap
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
                        "Apply To Join HTI Housing",
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
                        buildInputField("ID", "Enter Your ID"),
                        buildInputField("Email", "Enter Your Email"),
                        buildInputField("Passwordr", "Enter Your Password"),
                        buildInputField("Department", "Enter Your Department"),
                        SizedBox(height: 35),
                        SizedBox(
                          child: Container(
width:250,                        //argin: EdgeInsets.only(left: 70, right: 70),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Waiting(),
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
                                  "Request to join",
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
                              "Already requested housing?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login()),
                                );
                              },
                              child: Center(
                                child: Text(
                                  "Login..",
                                  style: TextStyle(
                                    color: Color(0xFFEEA1B3),

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

  Widget buildInputField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height:10),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left:3.0),
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
          height:61,
width:343,
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
