import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradproject/signup_login/student_profile.dart';

import 'login.dart';

class Signup extends StatelessWidget {
  static const String routeName = 'signup';
  final Widget Function()? routeClass;

   Signup(this.routeClass);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color(0xFF1A2A4D),
          Color(0xFF1A2A4D),
          Colors.white,
        ])),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInUp(
                        duration: Duration(milliseconds: 1000),
                        child: Text(
                          "Signup",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeInUp(
                        duration: Duration(milliseconds: 1300),
                        child: Text(
                          "Create Your Account",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        FadeInUp(
                            duration: Duration(milliseconds: 1400),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue.shade100,
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Enter Your Name",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Email or Phone number",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 40),
                        Column(children: [
                          FadeInUp(
                            duration: Duration(milliseconds: 1500),
                            child: Row(
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
                                          builder: (context) =>
                                              Login()), // التنقل إلى صفحة تسجيل الدخول
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      "Login..",
                                      style: TextStyle(
                                        color: Color(0xFF1A2A4D),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: 20), // مسافة بين FadeInUp والزر الجديد
                          Container(
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          StudentProfile()), // التنقل إلى صفحة تسجيل الدخول
                                );
                              },
                              height: 50,
                              color: Color(0xFF1A2A4D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  "Sign up ", // يمكنك تغيير النص إذا أردت
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ]),
                    ),
                  ),
                ]),
              ),
            ]),
      ),
    );
  }
}
