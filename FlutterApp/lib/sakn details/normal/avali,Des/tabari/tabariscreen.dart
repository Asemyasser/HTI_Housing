import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/sakn%20details/normal/avali,Des/tabari/tabariDesc.dart';

import '../../../classe_for_import/screen1.dart';

class AlTabari extends StatelessWidget {
  List<List<scrollTwo>>scrollTwoList= [
    [
      scrollTwo(roomNumber:"1",routeClass:()=>AlTabaridesc(),),
      scrollTwo(roomNumber: '1',routeClass:()=>AlTabaridesc(),),
      scrollTwo(roomNumber: '1',routeClass:()=>AlTabaridesc(),),
      scrollTwo(roomNumber: '1',routeClass:()=>AlTabaridesc(),),
    ],

    [
      scrollTwo(roomNumber:"1",routeClass:()=>AlTabaridesc(),),
      scrollTwo(roomNumber: '1',routeClass:()=>AlTabaridesc(),),
      scrollTwo(roomNumber: '1',routeClass:()=>AlTabaridesc(),),
      scrollTwo(roomNumber: '1',routeClass:()=>AlTabaridesc(),),
    ],
    [
      scrollTwo(roomNumber:"1",routeClass:()=>AlTabaridesc(),),
      scrollTwo(roomNumber: '1',routeClass:()=>AlTabaridesc(),),
      scrollTwo(roomNumber: '1',routeClass:()=>AlTabaridesc(),),
      scrollTwo(roomNumber: '1',routeClass:()=>AlTabaridesc(),),
    ], [
      scrollTwo(roomNumber:"1",routeClass:()=>AlTabaridesc(),),
      scrollTwo(roomNumber: '1',routeClass:()=>AlTabaridesc(),),
      scrollTwo(roomNumber: '1',routeClass:()=>AlTabaridesc(),),
      scrollTwo(roomNumber: '1',routeClass:()=>AlTabaridesc(),),
    ], [
      scrollTwo(roomNumber:"1",routeClass:()=>AlTabaridesc(),),
      scrollTwo(roomNumber: '1',routeClass:()=>AlTabaridesc(),),
      scrollTwo(roomNumber: '1',routeClass:()=>AlTabaridesc(),),
      scrollTwo(roomNumber: '1',routeClass:()=>AlTabaridesc(),),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ScreenOne(buildingName:AppLocalizations.of(context)!.al_tabari,scrollTwoList:scrollTwoList,FloorNumberList: [ AppLocalizations.of(context)!.first_floor,
      AppLocalizations.of(context)!.second_floor,
      AppLocalizations.of(context)!.third_floor,
      AppLocalizations.of(context)!.fourth_floor,
      AppLocalizations.of(context)!.fifth_floor],));
  }
}
