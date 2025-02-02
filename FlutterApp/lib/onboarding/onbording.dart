import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import '../signup_login/gender.dart';

class CustomOnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding';
  @override
  _CustomOnboardingScreenState createState() => _CustomOnboardingScreenState();
}

class _CustomOnboardingScreenState extends State<CustomOnboardingScreen>
    with TickerProviderStateMixin {
  final PageController pageController = PageController();
  int currentIndex = 0;
  ui.Image? backgroundImage;

  List<Map<String, String>> onboardingItems = [
    {
      'title': "Welcome to HTI housing",
      'text': "We are here to help you find the perfect student accommodation.",
      'imagePath': "assets/image/onBoirdin1.jpg",
    },
    {
      'title': "Book your place easily",
      'text': "Find and book your accommodation with just a few clicks.",
      'imagePath': "assets/image/onBoirdin2.jpg",
    },
    {
      'title': "Easily track bus schedules",
      'text': "Track university bus schedules to avoid missing your ride.",
      'imagePath': "assets/image/onBording3.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadImage(onboardingItems[0]['imagePath']!);
  }

  Future<void> _loadImage(String imagePath) async {
    final ByteData data = await rootBundle.load(imagePath);
    final ui.Codec codec =
    await ui.instantiateImageCodec(data.buffer.asUint8List());
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    setState(() {
      backgroundImage = frameInfo.image;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // الخلفية (الصورة)
          if (backgroundImage != null)
            CustomPaint(
              painter: OnboardingImagePainter(backgroundImage!, size.height * 0.7),
              child: SizedBox(
                height: size.height * 0.7,
                width: size.width,
              ),
            ),

          // المحتوى (النصوص وأزرار التنقل)
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                 color: Colors.white,
                height: size.height * 0.38, // زيادة الارتفاع
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: onboardingItems.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                            _loadImage(onboardingItems[currentIndex]['imagePath']!);
                          });
                        },
                        itemBuilder: (context, index) {
                          final item = onboardingItems[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(onboardingItems.length, (index) {
                                    return AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      margin: EdgeInsets.symmetric(horizontal: 4),
                                      height: 8,
                                      width: currentIndex == index ? 16 : 8,
                                      decoration: BoxDecoration(
                                        color: currentIndex == index
                                            ? Colors.black
                                            : Colors.black26,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    );
                                  }),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  item['title']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  item['text']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    // أزرار التنقل
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // زر تخطي (Skip)
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Gender()), // Replace with actual Signup widget
                              );
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          // زر التالي (Next)
                          FloatingActionButton(
                            onPressed: () {
                              if (currentIndex == onboardingItems.length - 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Gender()), // Replace with actual Signup widget
                                );
                              } else {
                                pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            backgroundColor: Colors.white,
                            child: Icon(Icons.arrow_forward_ios, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// كلاس لرسم الصورة في الخلفية
class OnboardingImagePainter extends CustomPainter {
  final ui.Image backgroundImage;
  final double imageHeight;

  OnboardingImagePainter(this.backgroundImage, this.imageHeight);

  @override
  void paint(Canvas canvas, Size size) {
    Rect imageRect = Rect.fromLTWH(0, 0, size.width, imageHeight);
    canvas.drawImageRect(
      backgroundImage,
      Rect.fromLTWH(0, 0, backgroundImage.width.toDouble(),
          backgroundImage.height.toDouble()),
      imageRect,
      Paint(),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
