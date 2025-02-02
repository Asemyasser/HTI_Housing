import 'package:flutter/material.dart';

class SelectedItem extends StatelessWidget {
  final String selectedText;
SelectedItem(this.selectedText);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
        padding:  EdgeInsets.symmetric(horizontal: 12,vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),

          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(selectedText,),
            Icon(Icons.check),
          ],
        ),

    );
  }
}
