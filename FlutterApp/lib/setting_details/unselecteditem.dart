import 'package:flutter/cupertino.dart';

class UnSelectedItem extends StatelessWidget {
  final String selectedText; // اجعلها final
  UnSelectedItem(this.selectedText);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Text(selectedText),
    );
  }
}
