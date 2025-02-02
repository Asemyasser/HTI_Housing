import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../classe_for_import/screen1.dart';
import 'Al_62_description.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Al62Screen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    List<scroll> scrollList=[
      scroll(iconName: "assets/image/saknDetails/floor.svg",iconTitle: AppLocalizations.of(context)!.floor,iconText: "5"),
      scroll(iconName: "assets/image/saknDetails/shaa.svg",iconTitle: AppLocalizations.of(context)!.apartment,iconText:AppLocalizations.of(context)!.a4Floor),
      scroll(iconName:"assets/image/saknDetails/bed.svg", iconTitle:AppLocalizations.of(context)!.roomm, iconText:AppLocalizations.of(context)!.doubleSingle),
      scroll(iconName:"assets/image/saknDetails/kitchen.svg", iconTitle:AppLocalizations.of(context)!.kitchen, iconText:AppLocalizations.of(context)!.a1apartment),
      scroll(iconName: "assets/image/saknDetails/stove.svg", iconTitle:AppLocalizations.of(context)!.stove, iconText:AppLocalizations.of(context)!.a1apartment),
      scroll(iconName:"assets/image/saknDetails/bathroom.svg", iconTitle:AppLocalizations.of(context)!.bathroom, iconText:AppLocalizations.of(context)!.a1apartment),
      scroll(iconName: "assets/image/saknDetails/coldair.svg", iconTitle:AppLocalizations.of(context)!.coldair, iconText:"1"),

    ];
    List<scroll>scrollListlist=[

      scroll(iconName:"assets/image/saknDetails/entertainment.svg", iconTitle:AppLocalizations.of(context)!.entertainment, iconText:AppLocalizations.of(context)!.roomm),
      scroll(iconName: "assets/image/saknDetails/tv.svg", iconTitle:AppLocalizations.of(context)!.screen, iconText:""),
      scroll(iconName:"assets/image/saknDetails/tree.svg", iconTitle:AppLocalizations.of(context)!.fruit_trees, iconText:""),
      scroll(iconName: "assets/image/saknDetails/greenArea.svg", iconTitle: AppLocalizations.of(context)!.green_area, iconText:"  "),

    ];



    List<List<scrollTwo>>scrollTwoList= [
      [
        scrollTwo(apartmentNumber:" 1",roomNumber:" 3(double)",routeClass:()=>Al62Description()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>Al62Description()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>Al62Description()),
      ],
      [
        scrollTwo(apartmentNumber:" 1",roomNumber:" 3(double)",routeClass:()=>Al62Description()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>Al62Description()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>Al62Description()),
      ], [
        scrollTwo(apartmentNumber:" 1",roomNumber:" 3(double)",routeClass:()=>Al62Description()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>Al62Description()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>Al62Description()),
      ], [
        scrollTwo(apartmentNumber:" 1",roomNumber:" 3(double)",routeClass:()=>Al62Description()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>Al62Description()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>Al62Description()),
      ], [
        scrollTwo(apartmentNumber:" 1",roomNumber:" 3(double)",routeClass:()=>Al62Description()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>Al62Description()),
        scrollTwo(apartmentNumber:" 1",roomNumber: ' 3(double)',routeClass:()=>Al62Description()),
      ],
    ];

    return Scaffold(
      body: ScreenOne(buildingName:AppLocalizations.of(context)!.al62, Neighborhoodnumber:"62",
    scrollList:scrollList, scrollTwoList:scrollTwoList,scrollListlist:scrollListlist,FloorNumberList:  [AppLocalizations.of(context)!.first_floor,AppLocalizations.of(context)!.second_floor,AppLocalizations.of(context)!.third_floor,AppLocalizations.of(context)!.fourth_floor,AppLocalizations.of(context)!.fifth_floor],),
    );


  }

}