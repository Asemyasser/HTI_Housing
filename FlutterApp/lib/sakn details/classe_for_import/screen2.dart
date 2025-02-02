// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import '../../AppTheme.dart';
// import '../../setting_details/setting_provider.dart';
// import '../bookRoom.dart';
//
// class Screen2 extends StatelessWidget {
//   final String? title1;
//   final String? title2;
//   final String? imagepath;
//   final String? profileimage;
//   final String? price;
//   final List<Widget>? scrollList; // Ensure this is a List of Widgets
//
//   Screen2(
//       {this.scrollList,
//       this.title1,
//       this.title2,
//       this.imagepath,
//       this.profileimage,
//       this.price});
//
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<SettingProvider>(context);
//
//     return Scaffold(
//         backgroundColor: provider.isDark()
//             ? MyTheme.darkTheme.scaffoldBackgroundColor
//             : MyTheme.lightTheme.scaffoldBackgroundColor,
//         body: Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Stack(
//                     children:[ Container(
//                       height: 250,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage('assets/image/saknDetails/bookroom.jpg'), // Add your image here
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20.0, top: 30),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context); // Go back to the previous screen
//                           },
//                           child: SvgPicture.asset(
//                             'assets/image/backIcon.svg',
//                             width: 20.0,
//                             height: 20.0,
//                             color:  Colors.white,
//                           ),
//                         ),
//                       ),
//                     ]
//                 ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 20,),
//
//                     Text(title1 ?? 'Default Title 1',
//                         style: provider.isDark()
//                             ? MyTheme.darkTheme.textTheme.bodyLarge
//                             : MyTheme.lightTheme.textTheme.bodyLarge),
//                     // Fallback for title1
//                     Text(title2 ?? 'Default Title 2',
//                         style: provider.isDark()
//                             ? MyTheme.darkTheme.textTheme.titleMedium
//                             : MyTheme.lightTheme.textTheme
//                                 .bodyLarge), // Fallback for title2
//                     SizedBox(height: 10,),
//                     Text("About",
//                         style: provider.isDark()
//                             ? MyTheme.darkTheme.textTheme.bodyMedium
//                             : MyTheme.lightTheme.textTheme.bodyMedium),
//                     Container(
//                       height: 100,
//                       width: 400,
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children:
//                               scrollList ?? [], // Use the scrollList directly
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//               Spacer(),
//               Center(
//                 child: Container(
//                   width: double.infinity, // Container width
//                   height: 60,
//                   decoration: BoxDecoration(
//                     color: provider.isDark()
//                         ? MyTheme.kohli
//                         : Colors
//                             .white, // Container color, you can change this as needed
//                     borderRadius: BorderRadius.circular(
//                         10), // Optional: Add radius if needed
//                     boxShadow: [
//                       BoxShadow(
//                         color: provider.isDark()
//                             ? Color(0xFF2B447B)
//                             : Colors.grey.shade300, // Shadow color
//                         blurRadius: 10.0, // Spread of the shadow
//                         offset: Offset(0, 4), // Horizontal and vertical offset
//                         spreadRadius:
//                             5.0, // Makes the shadow spread beyond the container's border
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           crossAxisAlignment:
//                               CrossAxisAlignment.start, // Ensure alignment
//                           children: [
//                             Text(
//                               "Price",
//                               style: provider.isDark()
//                                   ? MyTheme.darkTheme.textTheme.titleSmall
//                                   : MyTheme.lightTheme.textTheme.titleSmall,
//                             ),
//                             Text(
//                               price ?? 'N/A',
//                               style: provider.isDark()
//                                   ? MyTheme.darkTheme.textTheme.titleSmall
//                                   : MyTheme.lightTheme.textTheme.titleSmall,
//                             ), // Fallback for price
//                           ],
//                         ),
//                       ),
//                       Spacer(),
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Container(decoration: BoxDecoration(
//                             color:provider.isDark()?MyTheme.kohli:MyTheme.romady),
//                           height: 60,
//                           width: 100,
//                           child: TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => BookRoom()));
//                             },
//                             child: Text(
//                               "Book now",
//                               style: provider.isDark()
//                                   ? MyTheme.lightTheme.textTheme.titleSmall
//                                   : MyTheme.darkTheme.textTheme.titleSmall,
//                             ),
//                             style: TextButton.styleFrom(
//                               backgroundColor: provider.isDark()
//                                   ? MyTheme.romady
//                                   : MyTheme.kohli,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ])));
//   }
// }
//
//
//
// // import 'package:flutter/material.dart';
// // class Screen2 extends StatelessWidget {
// //   final String? title1;
// //   final String? title2;
// //   final String? imagepath;
// //   final String? profileimage;
// //   final String? price;
// //   final List<Widget>? scrollList; // Ensure this is a List of Widgets
// //
// //   Screen2(
// //       {this.scrollList,
// //         this.title1,
// //         this.title2,
// //         this.imagepath,
// //         this.profileimage,
// //         this.price});
// //   @override
// //   Widget build(BuildContext context) {
// //     var provider = Provider.of<SettingProvider>(context);
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //           child: Column(
// //               children: [
// //                 // Top Image
// //                 Stack(
// //                     children:[ Container(
// //                       height: 250,
// //                       decoration: BoxDecoration(
// //                         image: DecorationImage(
// //                           image: AssetImage('assets/image/saknDetails/bookroom.jpg'), // Add your image here
// //                           fit: BoxFit.cover,
// //                         ),
// //                       ),
// //                     ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(left: 20.0, top: 50),
// //                         child: GestureDetector(
// //                           onTap: () {
// //                             Navigator.pop(context); // Go back to the previous screen
// //                           },
// //                           child: SvgPicture.asset(
// //                             'assets/image/backIcon.svg',
// //                             width: 20.0,
// //                             height: 20.0,
// //                             color:  Colors.white,
// //                           ),
// //                         ),
// //                       ),
// //                     ]
// //                 ),
// //                 SizedBox(height: 20),
// //
// //                 // Room Title
// //                 Align(
// //                   alignment: Alignment.centerLeft,
// //                   child: Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 20),
// //                     child: Text(
// //                       'Room: 12',
// //                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// //                     ),
// //                   ),),
// //                 SizedBox(height: 10),
// //
// //                 // Room Details
// //                 Align(
// //                   alignment: Alignment.centerLeft,
// //                   child: Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 20),
// //                     child: Text(
// //                       'About',
// //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(height: 10),
// //
// //                 // Room Stats (Rooms, Wardrobe, Air Conditioning)
// //                 Container(
// //                   height: 100,
// //                   width: 400,
// //                   child: SingleChildScrollView(
// //                     scrollDirection: Axis.horizontal,
// //                     child: Row(
// //                       children:
// //                       scrollList ?? [], // Use the scrollList directly
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(height: 20),
// //
// //                 // Contact details
// //                 Align(
// //                   alignment: Alignment.centerLeft,
// //                   child: Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 20),
// //                     child: Text(
// //                       'Contact Details',
// //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                     ),
// //                   ),),
// //                 SizedBox(height: 10),
// //
// //                 // Supervisor Contact Info
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 20),
// //                   child: Row(
// //                     children: [
// //                       CircleAvatar(
// //                         radius: 20,
// //                         backgroundImage: AssetImage('assets/images/supervisor_image.jpg'), // Supervisor Image
// //                       ),
// //                       SizedBox(width: 10),
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             'Available',
// //                             style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
// //                           ),
// //                           Text('Supervisor'),
// //                         ],
// //                       ),
// //                       Spacer(),
// //                       Icon(Icons.phone, color: Colors.blue),
// //                     ],
// //                   ),
// //                 ),
// //
// //                 // Price Section
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 20),
// //                   child: Row(
// //                       children: [
// //                         Column(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Align(
// //                               alignment: Alignment.centerLeft,
// //                               child: Padding(
// //                                 padding: const EdgeInsets.symmetric(horizontal: 20),
// //                                 child: Column(
// //                                   crossAxisAlignment: CrossAxisAlignment.start,
// //                                   children: [
// //                                     Text(
// //                                       'Price:',
// //                                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                                     ),
// //                                     SizedBox(height: 4), // Add some spacing between the two texts
// //                                     Text(
// //                                       '5300EGP /term',
// //                                       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //
// //                         Padding(
// //                             padding: const EdgeInsets.all(10.0),
// //                             child: Container(decoration: BoxDecoration(
// //                                 color:provider.isDark()?MyTheme.kohli:MyTheme.romady),
// //                               height: 60,
// //                               width: 100,
// //                               child: TextButton(
// //                                 onPressed: () {
// //                                   Navigator.push(
// //                                       context,
// //                                       MaterialPageRoute(
// //                                           builder: (context) => BookRoom()));
// //                                 },
// //                                 child: Text(
// //                                   "Book now",
// //                                   style: provider.isDark()
// //                                       ? MyTheme.lightTheme.textTheme.titleSmall
// //                                       : MyTheme.darkTheme.textTheme.titleSmall,
// //                                 ),
// //                                 style: TextButton.styleFrom(
// //                                   backgroundColor: provider.isDark()
// //                                       ? MyTheme.romady
// //                                       : MyTheme.kohli,
// //                                 ),
// //                               ),))
// //                       ]
// //                   ),
// //                 )
// //               ]
// //           )
// //       ),
// //
// //
// //     );
// //   }
// // }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';
import '../bookRoom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Screen2 extends StatelessWidget {
  final String? title1;
  final String? title2;
  final String? imagepath;
  final String? profileimage;
  final String? price;
  final List<Widget>? scrollList;

  Screen2({
    this.scrollList,
    this.title1,
    this.title2,
    this.imagepath,
    this.profileimage,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Scaffold(
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // الجزء العلوي: صورة خلفية وزر الرجوع
                        Stack(children: [
                          Container(
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/image/saknDetails/bookroom.jpg'), // Add your image here
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 28), // مسافة مناسبة من اليمين واليسار
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                'assets/image/backIcon.svg',
                                width:
                                    24.0, // زيادة الأبعاد لجعل الأيقونة أسهل في النقر
                                height: 24.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ]),

                        // النصوص والمحتوى
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                title1 ?? 'Default Title 1',
                                style: provider.isDark()
                                    ? MyTheme.darkTheme.textTheme.bodyLarge
                                    : MyTheme.lightTheme.textTheme.bodyLarge,
                              ),
                              Text(
                                title2 ?? 'Default Title 2',
                                style: provider.isDark()
                                    ? MyTheme.darkTheme.textTheme.titleMedium
                                    : MyTheme.lightTheme.textTheme.bodyLarge,
                              ),
                              SizedBox(height: 10),
                              Text(
                                AppLocalizations.of(context)!.about,
                                style: provider.isDark()
                                    ? MyTheme.darkTheme.textTheme.bodyMedium
                                    : MyTheme.lightTheme.textTheme.bodyMedium,
                              ),
                              Container(
                                height: 100,
                                width: double.infinity,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: scrollList ??
                                        [
                                          Text("Default Item"),
                                        ], // Use the scrollList directly
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
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

          // الصف السفلي المثبت
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: provider.isDark()
                    ? MyTheme.kohli
                    : Colors.white, // لون الخلفية
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: provider.isDark()
                        ? Color(0xFF2B447B)
                        : Colors.grey.shade300,
                    blurRadius: 10.0,
                    offset: Offset(0, -4), // الظل من الأعلى
                    spreadRadius: 5.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.price,
                          style: provider.isDark()
                              ? MyTheme.darkTheme.textTheme.titleSmall
                              : MyTheme.lightTheme.textTheme.titleSmall,
                        ),
                        Text(
                          price ?? 'N/A',
                          style: provider.isDark()
                              ? MyTheme.darkTheme.textTheme.titleSmall
                              : MyTheme.lightTheme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookRoom()),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.bookNow,
                        style: provider.isDark()
                            ? MyTheme.lightTheme.textTheme.titleSmall
                            : MyTheme.darkTheme.textTheme.titleSmall,
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor:
                            provider.isDark() ? MyTheme.romady : MyTheme.kohli,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
