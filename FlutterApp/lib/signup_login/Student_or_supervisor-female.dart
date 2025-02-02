import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../homescreen/home_female.dart';
import '../signup_login/superviser_profile.dart';

class StudentOrSupervisorFemale extends StatelessWidget {
  static const String routeName = 'student_or_supervisor_female';

  @override
  Widget build(BuildContext context) {
    // Helper method for navigation
    void navigateToScreen(BuildContext context, int index) {
      Widget screen;

      switch (index) {
        case 22:
          screen = HomeFemaleStudent();
          break;
        case 2:
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
            // Back button
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
            ),            // Main content
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Student or supervisor?",
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Student Option
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0XFFFF598B), width: 3),
                                  borderRadius: BorderRadius.circular(70),
                                ),
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
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  navigateToScreen(context, 22);
                                },
                                child: Container(
                                  width: 130,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    gradient: LinearGradient(
                                      colors: [Colors.pink, Colors.red.shade100],
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
                        // Supervisor Option
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0XFFFF598B), width: 3),
                                  borderRadius: BorderRadius.circular(70),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: ClipRRect(
                                    child: SvgPicture.asset(
                                      "assets/image/Supervisor.svg",
                                      width: 90,
                                      height: 90,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  navigateToScreen(context, 2);
                                },
                                child: Container(
                                  width: 130,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    gradient: LinearGradient(
                                      colors: [Colors.pink, Colors.red.shade100],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Supervisor",
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
