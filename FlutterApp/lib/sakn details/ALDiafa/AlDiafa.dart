import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../classe_for_import/screen1.dart';
import 'AlDiafa_description.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlDaifScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    List<scroll> scrollList=[
      scroll(iconName: "assets/image/saknDetails/floor.svg", iconTitle:AppLocalizations.of(context)!.floor,iconText: "5"),
      scroll(iconName: "assets/image/saknDetails/bed.svg",iconTitle:AppLocalizations.of(context)!.roomm, iconText:AppLocalizations.of(context)!.double24floor),
      scroll(iconName:"assets/image/saknDetails/bathroom.svg", iconTitle:AppLocalizations.of(context)!.bathroom, iconText:AppLocalizations.of(context)!.a1room),
      scroll(iconName:"assets/image/saknDetails/kitchen.svg", iconTitle:AppLocalizations.of(context)!.kitchen, iconText:AppLocalizations.of(context)!.a1room),
      scroll(iconName: "assets/image/saknDetails/stove.svg", iconTitle:AppLocalizations.of(context)!.stove, iconText:AppLocalizations.of(context)!.a1kitchen),
      scroll(iconName:"assets/image/saknDetails/coldair.svg", iconTitle:AppLocalizations.of(context)!.coldair, iconText:"1"),
    ];

    List<scroll>scrollListlist=[
      scroll(iconName:"assets/image/saknDetails/tennis.svg", iconTitle:AppLocalizations.of(context)!.tennis_table, iconText:""),
      scroll(iconName: "assets/image/saknDetails/tv.svg", iconTitle:AppLocalizations.of(context)!.screen, iconText:""),
      scroll(iconName: "assets/image/saknDetails/greenArea.svg", iconTitle:AppLocalizations.of(context)!.green_area, iconText:""),
      scroll(iconName: "assets/image/saknDetails/rest.svg", iconTitle: AppLocalizations.of(context)!.studentRestAreas, iconText:"  "),
    ];


    List<List<scrollTwo>>scrollTwoList= [
      [
        scrollTwo(apartmentNumber:" 1",roomNumber:" 3(double)",routeClass:()=>AlDaifDescription()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)', routeClass:()=>AlDaifDescription()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>AlDaifDescription()),
      ],
      [
        scrollTwo(apartmentNumber:" 1",roomNumber:" 3(double)",routeClass:()=>AlDaifDescription()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)', routeClass:()=>AlDaifDescription()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>AlDaifDescription()),
      ], [
        scrollTwo(apartmentNumber:" 1",roomNumber:" 3(double)",routeClass:()=>AlDaifDescription()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)', routeClass:()=>AlDaifDescription()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>AlDaifDescription()),
      ], [
        scrollTwo(apartmentNumber:" 1",roomNumber:" 3(double)",routeClass:()=>AlDaifDescription()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)', routeClass:()=>AlDaifDescription()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>AlDaifDescription()),
      ], [
        scrollTwo(apartmentNumber:" 1",roomNumber:" 3(double)",routeClass:()=>AlDaifDescription()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)', routeClass:()=>AlDaifDescription()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>AlDaifDescription()),
      ], [
        scrollTwo(apartmentNumber:" 1",roomNumber:" 3(double)",routeClass:()=>AlDaifDescription()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)', routeClass:()=>AlDaifDescription()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>AlDaifDescription()),
      ],
    ];

    return Scaffold(
      body: ScreenOne(buildingName:AppLocalizations.of(context)!.diafa, scrollList:scrollList, scrollTwoList:scrollTwoList,scrollListlist:scrollListlist,FloorNumberList:
      [AppLocalizations.of(context)!.first_floor,AppLocalizations.of(context)!.second_floor,AppLocalizations.of(context)!.third_floor,AppLocalizations.of(context)!.fourth_floor,AppLocalizations.of(context)!.fifth_floor],),
    );



  }

}