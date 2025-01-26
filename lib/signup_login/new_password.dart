import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradproject/signup_login/superviser_profile.dart';

import '../homescreen/home_female.dart';
import '../homescreen/home_male.dart';

class NewPass extends StatelessWidget {
  final int? index;
  NewPass({this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // تعيين لون خلفية التطبيق
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 60),
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
              SizedBox(height: 100),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   // SizedBox(height: 10),
                    Center(
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1300),
                        child: Text(
                          "Create new password",
                          style: TextStyle(
                            color: Color(0xFF1A2A4D),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                   SizedBox(height: 10),
                    Center(
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1300),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0,right: 30),
                          child: Text(
                            "Your new password must be unique from those previously used",
                            style: TextStyle(
                              color: Color(0xFF1A2A4D),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    FadeInUp(
                      duration: Duration(milliseconds: 1400),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 3.0),
                                child: Text(
                                  "New Password",
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
                                  hintText: "Enter New Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(),
                                  suffixIcon: Icon(Icons.visibility),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 3.0),
                                child: Text(
                                  "Confirm Password",
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
                                  hintText: "**********",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(),
                                  suffixIcon: Icon(Icons.visibility_off_rounded),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    FadeInUp(
                      duration: Duration(milliseconds: 1600),
                      child: Container(
                        margin: EdgeInsets.only(left: 70, right: 70),
                        child: MaterialButton(
                          onPressed: () {
                            if (index == 11) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomemaleStudent()),
                              );
                            } else if (index == 22) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeFemaleStudent()),
                              );
                            } else if (index == 1 || index == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuperviseProfile()),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuperviseProfile()),
                              );
                            }
                          },
                          height: 50,
                          color: Color(0xFF1A2A4D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "Reset Password",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
