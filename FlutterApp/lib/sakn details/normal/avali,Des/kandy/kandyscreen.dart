import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../classe_for_import/screen1.dart';
import 'KandyDesc.dart';

class AlKandy extends StatelessWidget {
  List<List<scrollTwo>>scrollTwoList= [
    [
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),


    ],
    [
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),


    ],[
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),


    ],
    [
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),


    ],[
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),
      scrollTwo(roomNumber:"1",routeClass:()=>Kandydesc(),),


    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ScreenOne(buildingName:AppLocalizations.of(context)!.al_kindy,scrollTwoList:scrollTwoList,FloorNumberList: [ AppLocalizations.of(context)!.first_floor,
      AppLocalizations.of(context)!.second_floor,
      AppLocalizations.of(context)!.third_floor,
      AppLocalizations.of(context)!.fourth_floor,
      AppLocalizations.of(context)!.fifth_floor],));
  }
}
