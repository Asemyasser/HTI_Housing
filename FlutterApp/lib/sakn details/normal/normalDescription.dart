import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../classe_for_import/screen1.dart';
import '../classe_for_import/screen2.dart';

class AlNormalDescription extends StatelessWidget {
  final String? roomN;

  AlNormalDescription({Key? key, this.roomN}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<scroll> scrollList = [
      scroll(
          iconName: "assets/image/saknDetails/bed.svg",
          iconTitle: AppLocalizations.of(context)!.roomm,
          iconText: AppLocalizations.of(context)!.bed2),
      scroll(
          iconName: "assets/image/saknDetails/Wardrobe.svg",
          iconTitle: AppLocalizations.of(context)!.wardrobe,
          iconText: "2"),
      scroll(
          iconName: "assets/image/saknDetails/studydesk.svg",
          iconTitle: AppLocalizations.of(context)!.studyDesk,
          iconText: "2"),
      scroll(
          iconName: "assets/image/saknDetails/balcony.svg",
          iconTitle: AppLocalizations.of(context)!.balcony,
          iconText: "1"),
      scroll(
          iconName: "assets/image/saknDetails/mirror.svg",
          iconTitle: AppLocalizations.of(context)!.mirrors,
          iconText: "1"),
    ];

    return Screen2(
      scrollList: scrollList,
      price: "200EGP/term",
      profileimage: "assets/image/girl.png",
      title1: AppLocalizations.of(context)!.room(roomN ??''),
      imagepath: "assets/image/Frame 500.png",
    );
  }
}
