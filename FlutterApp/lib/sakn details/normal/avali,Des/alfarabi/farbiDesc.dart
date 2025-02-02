import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../classe_for_import/screen1.dart';
import '../../../classe_for_import/screen2.dart';

class Farbidescdesc extends StatelessWidget {
  List<scroll> scrollList=[
    scroll(iconName: "assets/image/saknDetails/bed.svg",iconTitle: "Room:",iconText: "2 bed"),
    scroll(iconName:"assets/image/saknDetails/Wardrobe.svg", iconTitle:"Wardrobe :", iconText:"2"),
    scroll(iconName:"assets/image/saknDetails/studydesk.svg", iconTitle:"study desk :", iconText:"2"),
    scroll(iconName: "assets/image/saknDetails/balcony.svg", iconTitle: "Balacony :", iconText:"1"),
    scroll(iconName: "assets/image/saknDetails/mirror.svg", iconTitle:"Mirror", iconText:"1")
  ];

  @override
  Widget build(BuildContext context) {
    return Screen2(scrollList: scrollList,price:"100EGP/term",profileimage:"assets/image/Vector.png",title1:"Room 1",imagepath:"assets/image/Vector.png",);
  }
}
