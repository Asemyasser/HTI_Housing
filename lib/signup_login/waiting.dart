import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Waiting extends StatelessWidget {
  const Waiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Lottie.asset("assets/image/Animation - 1729947779956.json"),
            SizedBox(
              height: 100,
            ),
            Center(
              child: FadeInUp(
                  duration: Duration(milliseconds: 1300),
                  child: Text(
                    "“Processing Your Request”",
                    style: TextStyle(
                        color: Color(0xFF1A2A4D),
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0,right: 50.0,top: 20),
              child: Center(
                child: FadeInUp(
                    duration: Duration(milliseconds: 1300),
                    child: Text(
                          "   Your request has been successfully submitted."
                          "We are currently reviewing your information."
                          "You will be notified once the review is complete.",
                      style: TextStyle(
                          color: Color(0xFF1A2A4D),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
