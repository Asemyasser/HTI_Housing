

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../available_room.dart';

class AlFarabiAvaliableRoom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    List<List<scrollRoom>>scrollRoomsList= [
      [
        scrollRoom(roomNumber: '1', details: '',),
        scrollRoom(roomNumber: '1', details: '',),
        scrollRoom(roomNumber: '1', details: '',),
        scrollRoom(roomNumber: '1', details: '',),
      ],
      [
        scrollRoom(roomNumber: '1', details: '',),
        scrollRoom(roomNumber: '1', details: '',),
        scrollRoom(roomNumber: '1', details: '',),
        scrollRoom(roomNumber: '1', details: '',),
      ], [
        scrollRoom(roomNumber: '1', details: '',),
        scrollRoom(roomNumber: '1', details: '',),
        scrollRoom(roomNumber: '1', details: '',),
        scrollRoom(roomNumber: '1', details: '',),
      ], [
        scrollRoom(roomNumber: '1', details: '',),
        scrollRoom(roomNumber: '1', details: '',),
        scrollRoom(roomNumber: '1', details: '',),
        scrollRoom(roomNumber: '1', details: '',),
      ], [
        scrollRoom(roomNumber: '1', details: '',),
        scrollRoom(roomNumber: '1', details: '',),
        scrollRoom(roomNumber: '1', details: '',),
        scrollRoom(roomNumber: '1', details: '',),
      ],
    ];

    return Scaffold(
        body: AvaliableRoom(
          scrollRoomsList:scrollRoomsList,
          FloorNumberList: [AppLocalizations.of(context)!.first_floor,AppLocalizations.of(context)!.second_floor
            ,AppLocalizations.of(context)!.third_floor,AppLocalizations.of(context)!.fourth_floor,
            AppLocalizations.of(context)!.fifth_floor],)
    );}
}
