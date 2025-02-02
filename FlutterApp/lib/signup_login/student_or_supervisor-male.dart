import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradproject/signup_login/superviser_profile.dart';

import '../homescreen/home_male.dart';

class StudentOrSupervisorMale extends StatelessWidget {
  static const String routeName = 'student_or_supervisor_male';

  @override
  Widget build(BuildContext context) {
    // Helper method for navigation
    void navigateToScreen(BuildContext context, int index) {
      Widget screen;

      switch (index) {
        case 11:
          screen = HomemaleStudent();
          break;
        case 1:
          screen = SuperviseProfile();
          break;
        default:
          screen = Scaffold(
            body: Center(
              child: Text('Screen not implemented for index: $index'),
            ),
          );
          break;
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          // Back Icon

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

          // Main Content
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Student or Supervisor?",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Student Column
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0XFF3FA5E3),
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(70),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SvgPicture.asset(
                                  "assets/image/male.svg",
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () => navigateToScreen(context, 11),
                              child: Container(
                                width: 130,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue.shade900,
                                      Colors.lightBlueAccent.shade100
                                    ],
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Student",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Supervisor Column
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0XFF3FA5E3),
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(70),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SvgPicture.asset(
                                  "assets/image/Supervisor.svg",
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () => navigateToScreen(context, 1),
                              child: Container(
                                width: 150,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue.shade900,
                                      Colors.lightBlueAccent.shade100
                                    ],
                                  ),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Manager or Supervisor",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
