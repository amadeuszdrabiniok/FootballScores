import 'package:flutter/material.dart';
import 'package:football_scores/screens/league_screen.dart';
import 'package:football_scores/services/football_data.dart';
import 'package:football_scores/services/result_arguments.dart';
import 'package:football_scores/widgets/go_button.dart';
import 'package:football_scores/widgets/logo.dart';

class SelectScreen extends StatefulWidget {
  static const String id = 'select_screen';

  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  List<Map> mapItems = [];
  Map<String, String> selectedLeague = {
    'leagueName': 'Ekstraklasa',
    'leagueID': '106'
  };

  void updateUI() async {
    List<Map> items = await FootballData().getLeagueData();
    setState(() {
      mapItems = items;
    });
  }

  DropdownButton dropdownButton() {
    List<DropdownMenuItem> dropdownItems = [];
    for (var dropdownItem in mapItems) {
      dropdownItems.add(
        DropdownMenuItem(
          value: dropdownItem['leagueID'],
          child: Center(
            child: Text(dropdownItem['leagueName']),
          ),
        ),
      );
    }
    return DropdownButton(
      isExpanded: true,
      items: dropdownItems,
      value: selectedLeague['leagueID'].toString(),
      onChanged: (value) {
        setState(() {
          selectedLeague['leagueID'] = value;
        });
      },
    );
  }

  @override
  void initState() {
    updateUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppLogo(),
              SizedBox(height: 20.0),
              Text(
                'Select league',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              dropdownButton(),
              SizedBox(height: 40.0),
              GoButton(
                label: 'GO!',
                onPressed: () async {
                  var teamsData = await FootballData()
                      .getTeamsData(selectedLeague['leagueID'].toString());

                  Navigator.pushNamed(
                    context,
                    LeagueScreen.id,
                    arguments: ResultArguments(
                      teamsData: teamsData,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
