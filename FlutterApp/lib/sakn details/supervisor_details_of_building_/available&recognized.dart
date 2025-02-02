
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Available_Recognized extends StatelessWidget {
  final Widget firstPage;
  final Widget secondPage;


  const Available_Recognized({
    Key? key,
    required this.firstPage,
    required this.secondPage,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => firstPage),
              );
            },
            child: Container(
              alignment: Alignment.center,

              height: 194,
              width: 220,
              decoration: BoxDecoration(
                color: Color(0xFFEEA1B3),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),

                child:  Text(
                  AppLocalizations.of(context)!.availableroom,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),

            ),
          ),
        ),
        SizedBox(height: 20,),
        Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => secondPage),);
            },
            child: Container(
              alignment: Alignment.center,
              height: 194,
              width: 220,
              decoration: BoxDecoration(
                color: Color(0xFF1A2A4D),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),

                child: Text(
                  AppLocalizations.of(context)!.recognized,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),

              ),
            ),
          ),
        ),

      ],
    );
  }
}
