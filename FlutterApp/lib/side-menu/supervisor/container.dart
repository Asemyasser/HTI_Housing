import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showRibbonDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(16), // Reduce padding for a smaller container
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/image/container/checkWrong.svg",
              height: 80, // Adjust size if needed
            ),
            SizedBox(height: 16),
            Text(
              "Are you sure you want to not save the permission?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  width: 110,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "RouteClass");
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF1A2A4D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 110,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close dialog after action
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Unsave",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}


void showGreenSaveDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 100),
                    SizedBox(height: 20),
                    Text(
                      "Saved Successfully",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Your changes have been saved successfully",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showAddCarModal(BuildContext context, Function(String, int, int) onAdd) {
  TextEditingController nameController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  String? _chosenReason;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your name',
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Room",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: roomController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your room number',
              ),
              keyboardType: TextInputType.number, // Restrict input to numbers
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _chosenReason,
              isExpanded: true,
              items: <String>['Late Arrival', 'Missing Homework', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                _chosenReason = newValue;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Reason",
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      roomController.text.isNotEmpty &&
                      _chosenReason != null) {
                    onAdd(
                      nameController.text,
                      int.parse(roomController.text),
                      _chosenReason == 'Late Arrival'
                          ? 1
                          : _chosenReason == 'Missing Homework'
                          ? 2
                          : 3,
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A2A4D),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
