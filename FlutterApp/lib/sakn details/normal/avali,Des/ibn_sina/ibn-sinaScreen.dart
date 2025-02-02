import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../classe_for_import/screen1.dart';
import 'ibn-sinaDesc.dart';

class IbnSina extends StatelessWidget {
  List<List<scrollTwo>> scrollTwoList = [
    [
      scrollTwo(
        roomNumber: "1",
        routeClass: () => IbnSinadesc(),
      ),
      scrollTwo(
        roomNumber: '1',
        routeClass: () => IbnSinadesc(),
      ),
      scrollTwo(
        roomNumber: '1',
        routeClass: () => IbnSinadesc(),
      ),
      scrollTwo(
        roomNumber: '1',
        routeClass: () => IbnSinadesc(),
      ),
    ],
    [
      scrollTwo(
        roomNumber: "1",
        routeClass: () => IbnSinadesc(),
      ),
      scrollTwo(
        roomNumber: '1',
        routeClass: () => IbnSinadesc(),
      ),
      scrollTwo(
        roomNumber: '1',
        routeClass: () => IbnSinadesc(),
      ),
      scrollTwo(
        roomNumber: '1',
        routeClass: () => IbnSinadesc(),
      ),
    ],
    [
      scrollTwo(
        roomNumber: "1",
        routeClass: () => IbnSinadesc(),
      ),
      scrollTwo(
        roomNumber: '1',
        routeClass: () => IbnSinadesc(),
      ),
      scrollTwo(
        roomNumber: '1',
        routeClass: () => IbnSinadesc(),
      ),
      scrollTwo(
        roomNumber: '1',
        routeClass: () => IbnSinadesc(),
      ),
    ],
    [
      scrollTwo(
        roomNumber: "1",
        routeClass: () => IbnSinadesc(),
      ),
      scrollTwo(
        roomNumber: '1',
        routeClass: () => IbnSinadesc(),
      ),
      scrollTwo(
        roomNumber: '1',
        routeClass: () => IbnSinadesc(),
      ),
      scrollTwo(
        roomNumber: '1',
        routeClass: () => IbnSinadesc(),
      ),
    ],
    [
      scrollTwo(
        roomNumber: "1",
        routeClass: () => IbnSinadesc(),
      ),
      scrollTwo(
        roomNumber: '1',
        routeClass: () => IbnSinadesc(),
      ),
      scrollTwo(
        roomNumber: '1',
        routeClass: () => IbnSinadesc(),
      ),
      scrollTwo(
        roomNumber: '1',
        routeClass: () => IbnSinadesc(),
      ),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenOne(
      buildingName: AppLocalizations.of(context)!.ibn_sina,
      scrollTwoList: scrollTwoList,
      FloorNumberList: [ AppLocalizations.of(context)!.first_floor,
        AppLocalizations.of(context)!.second_floor,
        AppLocalizations.of(context)!.third_floor,
        AppLocalizations.of(context)!.fourth_floor,
        AppLocalizations.of(context)!.fifth_floor],
    ));
  }
}
