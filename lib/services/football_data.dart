import 'package:football_scores/services/api_connector.dart';

class FootballData {
  Future<List<Map<String, String>>> getLeagueData() async {
    List<Map<String, String>> leagueItems = [];
    ApiConnector apiConnector = ApiConnector(
        'https://v3.football.api-sports.io/leagues?country=poland');

    var leagueData = await apiConnector.getDataFromApi();

    try {
      for (int i = 0; i < leagueData['results']; i++) {
        leagueItems.add({
          'leagueName': leagueData['response'][i]['league']['name'],
          'leagueID': leagueData['response'][i]['league']['id'].toString()
        });
      }
    } on Exception catch (e) {
      print(e);
    }
    print(leagueItems);
    return leagueItems;
  }

  Future<dynamic> getTeamsData(String leagueID) async {
    ApiConnector apiConnector = ApiConnector(
        'https://v3.football.api-sports.io/teams?league=$leagueID&season=2020');

    var leagueData = await apiConnector.getDataFromApi();

    return leagueData;
  }

  Future<dynamic> getTeamDetails(String teamID, String leagueID) async {
    ApiConnector apiConnector = ApiConnector(
        'https://v3.football.api-sports.io/teams/statistics?league=$leagueID&team=$teamID&season=2020');

    var leagueData = await apiConnector.getDataFromApi();

    return leagueData;
  }
}
