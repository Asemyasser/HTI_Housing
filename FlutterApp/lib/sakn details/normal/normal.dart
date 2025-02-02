import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../classe_for_import/screen1.dart';
import 'avali,Des/alfarabi/farabiscreen.dart';
import 'avali,Des/hassan/hassanscreen.dart';
import 'avali,Des/ibn_sina/ibn-sinaScreen.dart';
import 'avali,Des/jabarti/jabartiScreen.dart';
import 'avali,Des/jaberIbnHena/jaberIbnHenaScreen.dart';
import 'avali,Des/kandy/kandyscreen.dart';
import 'avali,Des/razi/raziscreen.dart';
import 'avali,Des/tabari/tabariscreen.dart';
import 'avali,Des/zahraa/zahraascreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlNormalScreen extends StatelessWidget {
  final List<scroll>? scrollList;
  AlNormalScreen({this.scrollList});
  Widget build(BuildContext context) {
    List<scroll> scrollList = [
      scroll(
          iconName: "assets/image/saknDetails/apartment.svg",
          iconTitle: AppLocalizations.of(context)!.building,
          iconText: "9"),
      scroll(
          iconName: "assets/image/saknDetails/floor.svg",
          iconTitle: AppLocalizations.of(context)!.floorr,
          iconText: AppLocalizations.of(context)!.a5building),
      scroll(
          iconName: "assets/image/saknDetails/shaa.svg",
          iconTitle: AppLocalizations.of(context)!.apartment,
          iconText: AppLocalizations.of(context)!.a2floor),
      scroll(
          iconName: "assets/image/saknDetails/bed.svg",
          iconTitle: AppLocalizations.of(context)!.roomm,
          iconText: AppLocalizations.of(context)!.single5apartment),
      scroll(
          iconName: "assets/image/saknDetails/kitchen.svg",
          iconTitle: AppLocalizations.of(context)!.kitchen,
          iconText: AppLocalizations.of(context)!.a1apartment),
      scroll(
          iconName: "assets/image/saknDetails/stove.svg",
          iconTitle: AppLocalizations.of(context)!.stove,
          iconText: AppLocalizations.of(context)!.a1kitchen),
      scroll(
          iconName: "assets/image/saknDetails/bathroom.svg",
          iconTitle: AppLocalizations.of(context)!.bathroom,
          iconText: AppLocalizations.of(context)!.a1apartment),
      scroll(
          iconName: "assets/image/saknDetails/coldair.svg",
          iconTitle: AppLocalizations.of(context)!.coldair,
          iconText: "1"),
    ];

    List<scroll> scrollListlist = [
      scroll(
          iconName: "assets/image/saknDetails/tennis.svg",
          iconTitle: AppLocalizations.of(context)!.tennis_table,
          iconText: ""),
      scroll(
          iconName: "assets/image/saknDetails/field.svg",
          iconTitle: AppLocalizations.of(context)!.fiveAsideFootballField,
          iconText: ""),
      scroll(
          iconName: "assets/image/saknDetails/rest.svg",
          iconTitle: AppLocalizations.of(context)!.studentRestAreas,
          iconText: "  "),
      scroll(
          iconName: "assets/image/saknDetails/tree.svg",
          iconTitle: AppLocalizations.of(context)!.fruit_trees,
          iconText: "  "),
      scroll(
          iconName: "assets/image/saknDetails/greenArea.svg",
          iconTitle: AppLocalizations.of(context)!.green_area,
          iconText: ""),
    ];
    List<String> names = [
      AppLocalizations.of(context)!.al_kindy,
      AppLocalizations.of(context)!.al_zahraa,
      AppLocalizations.of(context)!.al_razi,
      AppLocalizations.of(context)!.al_tabari,
      AppLocalizations.of(context)!.al_hassan,
      AppLocalizations.of(context)!.al_jabarti,
      AppLocalizations.of(context)!.ibn_sina,
      AppLocalizations.of(context)!.al_farabi,
      AppLocalizations.of(context)!.jaber_ibn_hayyan
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Image widget
          Container(
            height: 420,
            child: ScreenOne(
                buildingName: AppLocalizations.of(context)!.normal,
                Neighborhoodnumber: AppLocalizations.of(context)!.neighborhood2,
                scrollList: scrollList,
                scrollListlist: scrollListlist),
          ),
          // GridView
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // 2 columns in the grid
              crossAxisSpacing: 10.0, // Space between columns
              mainAxisSpacing: 10.0, // Space between rows
              padding: const EdgeInsets.all(10.0), // Padding around the grid
              children: List.generate(9, (index) {
                // List of navigation destinations
                List<Widget> routnav = [
                  AlKandy(),
                  AlZahraa(),
                  AlRazi(),
                  AlTabari(),
                  AlHassan(),
                  Aljabarti(),
                  IbnSina(),
                  AlFarabi(),
                  JaberIbnHayya(),
                ];

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the corresponding route
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => routnav[index]),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            Color(0xFFF0F0F0), // Background color of the boxes
                        borderRadius: const BorderRadius.all(
                            Radius.circular(20.0)), // Rounded corners
                      ),
                      child: Center(
                        child: Text(
                          names[
                              index], // Display the name corresponding to the index
                          style: const TextStyle(
                            color: Colors.black, // Text color
                            fontSize: 18, // Text size
                            fontWeight: FontWeight.bold, // Text weight
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
