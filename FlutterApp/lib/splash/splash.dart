import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import '../onboarding/onbording.dart';

class Splash extends StatefulWidget {
  static const String routeName = 'splash';
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _controller.forward();
    Timer(const Duration(seconds: 7), () {
      Navigator.of(context).pushReplacementNamed(CustomOnboardingScreen.routeName);
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // Get screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A2A4D),
              Colors.grey.shade300,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.04),
                      width: screenWidth * 0.2,
                      height: screenHeight * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(screenWidth * 0.4),
                      ),
                      child: Image.asset(
                        "assets/image/hti.png",
                        width: screenWidth * 0.18,
                        height: screenHeight * 0.09,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.15),
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.lime.shade50,
                              blurRadius: 30,
                              offset: Offset(0, 10))
                        ]),
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.28,
                    child: LiquidCircularProgressIndicator(
                      value: _controller.value,
                      valueColor: AlwaysStoppedAnimation(Colors.grey.shade300),
                      backgroundColor: Color(0xFF1A2A4D),
                      direction: Axis.vertical,
                      center: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: screenHeight * 0.10,
                            child: CustomPaint(
                              size: Size(screenWidth * 0.48, screenHeight * 0.45),
                              painter: HousePainter(),
                            ),
                          ),
                          Positioned(
                            top: screenHeight * 0.12,
                            right: screenWidth * 0.10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    ColorizeAnimatedText('HTI_Housing',
                                        textStyle: TextStyle(
                                          fontFamily: 'Itim',
                                          fontSize: screenWidth * 0.06,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        colors: [
                                          Color(0xFF1A2A4D),
                                          Colors.grey.shade500,
                                          Colors.grey.shade100,
                                        ],
                                        speed: Duration(milliseconds: 100)),
                                    WavyAnimatedText(
                                      'HTI_Housing',
                                      textStyle: TextStyle(
                                        fontSize: screenWidth * 0.06,
                                        fontFamily: 'Itim',
                                        color: Color(0xFF1A2A4D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                      speed: Duration(milliseconds: 200),
                                    ),
                                  ],
                                  isRepeatingAnimation: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HousePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFF1A2A4D) // لون حواف البيت
      ..style = PaintingStyle.stroke // نمط الحواف
      ..strokeWidth = 3; // عرض الحواف

    // مقياس الأبعاد لرسم البيت
    double scaleFactor = 0.6;

    // رسم قاعدة البيت بدون الحافة اليمنى
    canvas.drawLine(Offset(50 * scaleFactor, 50 * scaleFactor),
        Offset(50 * scaleFactor, 100 * scaleFactor), paint); // الحافة اليسرى
    canvas.drawLine(Offset(40 * scaleFactor, 100 * scaleFactor),
        Offset(290 * scaleFactor, 100 * scaleFactor), paint); // الحافة السفلية
    canvas.drawLine(Offset(50 * scaleFactor, 50 * scaleFactor),
        Offset(110 * scaleFactor, 50 * scaleFactor), paint); // الحافة العلوية

    // رسم السقف الأول
    Path roofPath = Path();
    roofPath.moveTo(
        50 * scaleFactor, 50 * scaleFactor); // بداية السقف الأول (اليسار)
    roofPath.lineTo(100 * scaleFactor, 0); // قمة السقف الأول
    roofPath.lineTo(
        150 * scaleFactor, 50 * scaleFactor); // نهاية السقف الأول (اليمين)
    roofPath.close(); // إغلاق المسار

    canvas.drawPath(roofPath, paint); // رسم السقف الأول

    // رسم السقف الثاني
    Path roofPath2 = Path();
    roofPath2.moveTo(40 * scaleFactor, 50 * scaleFactor); // بداية السقف الثاني
    roofPath2.lineTo(100 * scaleFactor, -6); // قمة السقف الثاني
    roofPath2.lineTo(160 * scaleFactor, 50 * scaleFactor); // نهاية السقف الثاني

    canvas.drawPath(roofPath2, paint); // رسم السقف الثاني
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
