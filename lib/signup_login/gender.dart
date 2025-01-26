import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradproject/signup_login/student_or_supervisor-male.dart';

import 'Student_or_supervisor-female.dart';

class Gender extends StatelessWidget {
  static const String routeName = 'gender';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("What is your gender ?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            Text(
              "Please note that this data will be recorded within the application.",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0XFF3FA5E3), width: 3),
                        borderRadius: BorderRadius.circular(70)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ClipRRect(
                        child: SvgPicture.asset(
                          "assets/image/male.svg",
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Signup page
                      Navigator.push(
                        context,
                        MaterialPageRoute(

                            builder: (context) =>
                                StudentOrSupervisorMale()), // Replace with actual Signup widget
                      );
                    },
                    child: Container(
                      width: 130,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            50), // يمكنك تعديل قيمة الحواف لتصبح أكثر استدارة أو أقل
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade900,
                            Colors.lightBlueAccent.shade100
                          ], // تدرج الألوان
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 30,
                            left: 40,
                            child: Text(
                              "male",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
                // CircleAvatar for Supervisor
              ),
              // CircleAvatar for Male

              // CircleAvatar for Female
              Expanded(
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0XFFFF598B), width: 3),
                        borderRadius: BorderRadius.circular(70)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ClipRRect(
                        child: SvgPicture.asset(
                          "assets/image/famale.svg",
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Signup page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StudentOrSupervisorFemale()), // Replace with actual Signup widget
                      );
                    },
                    child: Container(
                      width: 130,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            50), // يمكنك تعديل قيمة الحواف لتصبح أكثر استدارة أو أقل
                        gradient: LinearGradient(
                          colors: [
                            Colors.pink,
                            Colors.red.shade100
                          ], // تدرج الألوان
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 30,
                            left: 35,
                            child: Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
                // CircleAvatar for Supervisor
              )
            ]),
          ],
        ),
      ),
    );
  }
}

// Placeholder pages for navigation
class MalePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Male Page')),
      body: Center(child: Text('Welcome to the Male Page!')),
    );
  }
}

class FemalePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Female Page')),
      body: Center(child: Text('Welcome to the Female Page!')),
    );
  }
}

class SupervisorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Supervisor Page')),
      body: Center(child: Text('Welcome to the Supervisor Page!')),
    );
  }
}
