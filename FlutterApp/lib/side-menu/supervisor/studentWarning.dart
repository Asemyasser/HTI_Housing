import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';

class StudentWarning extends StatefulWidget {
  static const routeName = '/student-warning';
  @override
  _StudentWarningState createState() => _StudentWarningState();
}

class _StudentWarningState extends State<StudentWarning> {
  TextEditingController editingController = TextEditingController();
  final List<WarningContainer> duplicateItems = [
    WarningContainer(personName: "Malak Mohamed", RoomN: 2, nDelay: 1),
    WarningContainer(personName: "Salma Ayman", RoomN: 5, nDelay: 6),
    // Add more items here if needed
  ];

  // Filtered list to display
  List<WarningContainer> items = [];

  @override
  void initState() {
    items = List.from(duplicateItems); // Initialize with all items
    super.initState();
  }

  void filterSearchResults(String query) {
    setState(() {
      items = duplicateItems.where((item) {
        final personMatch = item.personName != null &&
            item.personName!.toLowerCase().contains(query.toLowerCase());
        final roomMatch =
            item.RoomN != null && item.RoomN.toString().contains(query);
        final delayMatch =
            item.nDelay != null && item.nDelay.toString().contains(query);
        return personMatch || roomMatch || delayMatch;
      }).toList();
    });
  }

  void showAddCarModal(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context, listen: false);

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
              Text( AppLocalizations.of(context)!.name,
                  style: provider.isDark()
                      ? MyTheme.darkTheme.textTheme.bodyLarge
                      : MyTheme.lightTheme.textTheme.bodyLarge),
              SizedBox(height: 10),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:'---------------------',
                ),
              ),
              SizedBox(height: 20),
              Text(AppLocalizations.of(context)!.roomm,
                  style: provider.isDark()
                      ? MyTheme.darkTheme.textTheme.bodyLarge
                      : MyTheme.lightTheme.textTheme.bodyLarge),
              SizedBox(height: 10),
              TextField(
                controller: roomController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:  '**',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Text(AppLocalizations.of(context)!.reason,
                  style: provider.isDark()
                      ? MyTheme.darkTheme.textTheme.bodyLarge
                      : MyTheme.lightTheme.textTheme.bodyLarge),
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
                  hintText: AppLocalizations.of(context)!.reason,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        roomController.text.isNotEmpty &&
                        _chosenReason != null) {
                      setState(() {
                        duplicateItems.add(
                          WarningContainer(
                            personName: nameController.text,
                            RoomN: int.parse(roomController.text),
                            nDelay: _chosenReason == 'Late Arrival'
                                ? 1
                                : _chosenReason == 'Missing Homework'
                                ? 2
                                : 3,
                          ),
                        );
                        filterSearchResults(editingController.text);
                      });
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    provider.isDark() ? MyTheme.romady : MyTheme.kohli,
                    foregroundColor:
                    provider.isDark() ? MyTheme.kohli : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.add
                    ,
                    style: provider.isDark()
                        ? MyTheme.darkTheme.textTheme.bodyLarge
                        : MyTheme.lightTheme.textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Scaffold(
      backgroundColor: provider.isDark()
          ? MyTheme.darkTheme.scaffoldBackgroundColor
          : MyTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: provider.isDark()
            ? MyTheme.darkTheme.appBarTheme.backgroundColor
            : MyTheme.lightTheme.appBarTheme.backgroundColor,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // مسافة مناسبة من اليمين واليسار
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/image/backIcon.svg',
              width: 24.0, // زيادة الأبعاد لجعل الأيقونة أسهل في النقر
              height: 24.0,
              color: Colors.white,
            ),
          ),
        ),
        leadingWidth: 56.0, // التأكد من أن العرض مناسب للأيقونة
        centerTitle: true,
        title: Center(
          child: Text(
            AppLocalizations.of(context)!.studentwarnings,
            style: provider.isDark()
                ? MyTheme.darkTheme.textTheme.titleLarge
                : MyTheme.lightTheme.textTheme.titleLarge,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: editingController,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.search,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                filled: true,
                fillColor: MyTheme.romady,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return items[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              onPressed: () {
                showAddCarModal(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                provider.isDark() ? MyTheme.romady : MyTheme.kohli,
                foregroundColor:
                provider.isDark() ? MyTheme.kohli : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              ),
              child: Text(
                AppLocalizations.of(context)!.click,
                style: provider.isDark()
                    ? MyTheme.lightTheme.textTheme.titleSmall
                    : MyTheme.darkTheme.textTheme.titleSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WarningContainer extends StatelessWidget {
  final String? personName;
  final int? RoomN;
  final int? nDelay;

  WarningContainer({this.personName, this.RoomN, this.nDelay});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: MyTheme.pinkColor, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.namee (personName ?? ''),
              style: provider.isDark()
                  ? MyTheme.darkTheme.textTheme.bodyLarge
                  : MyTheme.lightTheme.textTheme.bodyLarge,
            ),
            Text(AppLocalizations.of(context)!.room(RoomN ?? ''),
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyMedium
                    : MyTheme.lightTheme.textTheme.bodyMedium),
            Text(AppLocalizations.of(context)!.delaysWarning(nDelay ?? ''),
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyMedium
                    : MyTheme.lightTheme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
