import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

import 'forget_pass.dart';
import 'new_password.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView( // إضافة SingleChildScrollView هنا
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
                        height: 25.0,color: Color(0XFF60636C),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 80),
              Padding(
                padding: EdgeInsets.all(50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: Center(
                        child: Text(
                          "OTP Verification",
                          style: TextStyle(
                            color: Color(0xFF1A2A4D),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    FadeInUp(
                      duration: Duration(milliseconds: 1300),
                      child: Text(
                        "Enter the verification code we just sent on your email address",
                        style: TextStyle(
                          color: Color(0xFF1A2A4D),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    FadeInUp(
                      duration: Duration(milliseconds: 1400),
                      child: Pinput(
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            border: Border.all(color: Color(0XFFEEA1B3)),
                          ),
                        ),
                        onCompleted: (pin) => debugPrint(pin),
                      ),
                    ),
                    SizedBox(height: 50),
                    FadeInUp(
                      duration: Duration(milliseconds: 1600),
                      child: Container(
                        margin: EdgeInsets.only(left: 70, right: 70),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NewPass()),
                            );
                          },
                          height: 50,
                          color: Color(0xFF1A2A4D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "Verify",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    FadeInUp(
                      duration: Duration(milliseconds: 1600),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn’t receive code?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ForgetPass()),
                              );
                            },
                            child: Center(
                              child: Text(
                                "Resend",
                                style: TextStyle(
                                  color: Color(0xFFEEA1B3),
                                  fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
