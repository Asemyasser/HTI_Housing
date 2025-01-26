import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../classe_for_import/screen1.dart';
import 'alsafwaDescription.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlSafwaScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    List<scroll> scrollList=[
      scroll(iconName: "assets/image/saknDetails/floor.svg",iconTitle: AppLocalizations.of(context)!.floor,iconText: AppLocalizations.of(context)!.a2),
      scroll(iconName:"assets/image/saknDetails/bed.svg", iconTitle:AppLocalizations.of(context)!.roomm, iconText:AppLocalizations.of(context)!.double20floor),
      scroll(iconName:"assets/image/saknDetails/bathroom.svg", iconTitle:AppLocalizations.of(context)!.bathroom, iconText:AppLocalizations.of(context)!.a10floor),
      scroll(iconName:"assets/image/saknDetails/kitchen.svg", iconTitle:AppLocalizations.of(context)!.kitchen, iconText:AppLocalizations.of(context)!.a1floor),
      scroll(iconName: "assets/image/saknDetails/stove.svg", iconTitle: AppLocalizations.of(context)!.stove, iconText:AppLocalizations.of(context)!.a5kitchen),
      scroll(iconName: "assets/image/saknDetails/coldair.svg", iconTitle:AppLocalizations.of(context)!.coldair, iconText:AppLocalizations.of(context)!.a1floor),

    ];
    List<scroll>scrollListlist=[
      scroll(iconName: "assets/image/saknDetails/tv.svg", iconTitle: AppLocalizations.of(context)!.screen, iconText:" "),
      scroll(iconName:"assets/image/saknDetails/entertainment.svg", iconTitle:AppLocalizations.of(context)!.entertainment, iconText:AppLocalizations.of(context)!.roomm),
      scroll(iconName:"assets/image/saknDetails/tree.svg", iconTitle:AppLocalizations.of(context)!.fruit_trees, iconText:""),
      scroll(iconName: "assets/image/saknDetails/greenArea.svg", iconTitle: AppLocalizations.of(context)!.green_area, iconText:"  "),

    ];

    List<List<scrollTwo>>scrollTwoList= [
    [
      scrollTwo(roomNumber:"1", routeClass:()=>AlSafwaDescription()),
      scrollTwo(roomNumber: '1', routeClass:()=>AlSafwaDescription()),
      scrollTwo(roomNumber: '1',routeClass:()=>AlSafwaDescription()),
      scrollTwo(roomNumber: '1',routeClass:()=>AlSafwaDescription()),
    ],
      [
        scrollTwo(roomNumber:"1", routeClass:()=>AlSafwaDescription()),
        scrollTwo(roomNumber: '1', routeClass:()=>AlSafwaDescription()),
        scrollTwo(roomNumber: '1',routeClass:()=>AlSafwaDescription()),
        scrollTwo(roomNumber: '1',routeClass:()=>AlSafwaDescription()),
      ],
    ];

    return Scaffold(
      body: ScreenOne(buildingName:AppLocalizations.of(context)!.safwa, Neighborhoodnumber:"24",
          scrollList:scrollList, scrollTwoList:scrollTwoList,
          scrollListlist:scrollListlist,FloorNumberList: [AppLocalizations.of(context)!.first_floor,AppLocalizations.of(context)!.second_floor]),
    );



  }
  
}