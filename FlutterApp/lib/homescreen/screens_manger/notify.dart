// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:provider/provider.dart';
// import '../../AppTheme.dart';
// import '../../setting_details/setting_provider.dart';
// import '../../signup_login/superviser_profile.dart';
// import '../home_female.dart';
// import '../home_male.dart';
//
// class Notify extends StatefulWidget {
//   final int? index;
//
//   Notify({this.index});
//
//   @override
//   State<Notify> createState() => _NotifyState();
// }
//
// class _NotifyState extends State<Notify> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _timeController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<SettingProvider>(context);
//
//     TextDirection textDirection =
//     Localizations.localeOf(context).languageCode == 'ar'
//         ? TextDirection.rtl
//         : TextDirection.ltr;
//
//     return Scaffold(
//       backgroundColor: provider.isDark()
//           ? MyTheme.darkTheme.scaffoldBackgroundColor
//           : MyTheme.lightTheme.scaffoldBackgroundColor,
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 30),
//               Center(
//                 child: Image.asset(
//                   "assets/image/sakn/Group 18.png",
//                   width: 300,
//                   height: 260,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       AppLocalizations.of(context)!.notfytitle,
//                       style: provider.isDark()
//                           ? MyTheme.darkTheme.textTheme.bodyLarge
//                           : MyTheme.lightTheme.textTheme.bodyLarge,
//                       textAlign: textDirection == TextDirection.rtl
//                           ? TextAlign.right
//                           : TextAlign.left,
//                     ),
//                     SizedBox(height: 8),
//                     Container(
//                       height: 55,
//                       width: double.infinity,
//                       child: TextFormField(
//                         controller: _titleController,
//                         textDirection: textDirection,
//                         decoration: InputDecoration(
//                           hintStyle: provider.isDark()
//                               ? MyTheme.darkTheme.textTheme.bodyMedium
//                               : MyTheme.lightTheme.textTheme.bodyMedium,
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "Please provide a title.";
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               SizedBox(height: 80),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 156,
//                     child: MaterialButton(
//                       onPressed: () {
//                         // Navigation logic based on index
//                         if (widget.index == 11) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => HomemaleStudent()),
//                           );
//                         } else if (widget.index == 22) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => HomeFemaleStudent()),
//                           );
//                         } else if (widget.index == 1 || widget.index == 2) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => SuperviseProfile()),
//                           );
//                         } else {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => SuperviseProfile()),
//                           );
//                         }
//                       },
//                       height: 56,
//                       color: Colors.red,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       child: Center(
//                         child: Text(
//                           AppLocalizations.of(context)!.cancel,
//                           style: MyTheme.buttonText,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 20),
//                   Container(
//                     width: 156,
//                     child: MaterialButton(
//                       onPressed: () {
//                         if (_formKey.currentState?.validate() ?? false) {
//                           _showSuccessDialog(context);
//                         }
//                       },
//                       height: 56,
//                       color: provider.isDark() ? MyTheme.romady : MyTheme.kohli,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       child: Center(
//                         child: Text(
//                           AppLocalizations.of(context)!.submit,
//                           style: provider.isDark()
//                               ? MyTheme.lightTheme.textTheme.titleSmall
//                               : MyTheme.darkTheme.textTheme.titleSmall,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showSuccessDialog(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: Icon(Icons.check_circle, color: Colors.green, size: 60),
//             ),
//             content: Padding(
//               padding: const EdgeInsets.only(left: 50),
//               child: Text(AppLocalizations.of(context)!.sentsuccessfully),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); // Close the dialog
//                 },
//                 child: Text(AppLocalizations.of(context)!.ok),
//               ),
//             ],
//           );
//           },
//         );
//     }
// }