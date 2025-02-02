import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'otp_verication.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, top: 60), // تعديل الحواف لتتناسب مع التصميم
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
                      color: Colors.red, // Change to your desired color
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40,right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: Center(
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(                              color: Color(0xFF1C2833),
                               fontSize: 24,fontWeight: FontWeight.w700),

                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeInUp(
                      duration: Duration(milliseconds: 1300),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Don’t worry if occurs. Please enter the email address linked with your account.",
                          style: TextStyle(color:Color(0xFF1A2A4D), fontSize: 16,fontWeight: FontWeight.w500),
                        ),
                      )),
                ],
              ),
            ),
          //  SizedBox(height: 20),
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: ListView(
                    children:[ Column(
                      children: <Widget>[
                        FadeInUp(
                            duration: Duration(milliseconds: 1400),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height:10),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:3.0),
                                      child: Text(
                                        "Email",
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
                                        hintText: "Enter your email",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: OutlineInputBorder(),

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),),

                        SizedBox(
                          height: 40,
                        ),
                        FadeInUp(
                            duration: Duration(milliseconds: 1600),

                              child: Container(
                                margin: EdgeInsets.only(left: 70, right: 70),

                                child: MaterialButton(
                                  onPressed: () {

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => OtpVerification()),
                                    );
                                  },
                                  height: 50,
                                  color: Color(0xFF1A2A4D),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Send Code",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
