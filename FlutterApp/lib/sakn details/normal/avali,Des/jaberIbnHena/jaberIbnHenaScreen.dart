import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../classe_for_import/screen1.dart';
import 'jaberIbnHenaDesc.dart';

class JaberIbnHayya extends StatelessWidget {
  List<List<scrollTwo>> scrollTwoList = [
    [
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
    ],[
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
    ],[
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
    ],[
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
    ],
    [
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
    ],
    [
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
    ],
    [
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
      scrollTwo(
        roomNumber: "1",
        routeClass: () => JaberIbnHayyadesc(),
      ),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenOne(
      buildingName: AppLocalizations.of(context)!.jaber_ibn_hayyan,
      scrollTwoList: scrollTwoList,
      FloorNumberList: [
        AppLocalizations.of(context)!.first_floor,
        AppLocalizations.of(context)!.second_floor,
        AppLocalizations.of(context)!.third_floor,
        AppLocalizations.of(context)!.fourth_floor,
        AppLocalizations.of(context)!.fifth_floor
      ],
    ));
  }
}
