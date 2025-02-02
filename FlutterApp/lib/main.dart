import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/sakn%20details/bookRoom.dart';
import 'package:gradproject/setting_details/setting_provider.dart';
import 'package:gradproject/side-menu/supervisor/studentWarning.dart';
import 'package:gradproject/signup_login/Student_or_supervisor-female.dart';
import 'package:gradproject/signup_login/gender.dart';
import 'package:gradproject/signup_login/student_or_supervisor-male.dart';
import 'package:gradproject/splash/splash.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Scan/uploadImage.dart';
import 'excelFile.dart';
import 'onboarding/onbording.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
      create: (context) => SettingProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      navigatorKey: navigatorKey, // Assign the navigator key here
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: provider.themeMode,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentLanguage),
      initialRoute: Splash.routeName, // Set the initial route to Splash
      routes: {
        Splash.routeName: (context) => Splash(),
        Excel.routeName: (context) => Excel(),
        //BookRoom.routeName: (context) => BookRoom(),
        ImageUpload.routeName: (context) => ImageUpload(),
        StudentWarning.routeName: (context) => StudentWarning(),
        CustomOnboardingScreen.routeName: (context) => CustomOnboardingScreen(),
        Gender.routeName: (context) => Gender(),
        StudentOrSupervisorMale.routeName: (context) =>
            StudentOrSupervisorMale(),
        StudentOrSupervisorFemale.routeName: (context) =>
            StudentOrSupervisorFemale(),
      },
    );
  }
}
