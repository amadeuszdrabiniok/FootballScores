import 'dart:convert';
import 'package:football_scores/constants.dart';
import 'package:http/http.dart' as http;

class ApiConnector {
  final String url;
  ApiConnector(this.url);

  var headers = {
    'x-rapidapi-key': kApiKey,
    'x-rapidapi-host': kApiUrl,
  };

  Future<dynamic> getDataFromApi() async {
    var request = http.Request(
      'GET',
      Uri.parse(url),
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var recievedData = await response.stream.bytesToString();
      var decodedData = jsonDecode(recievedData);
      return decodedData;
    } else {
      print(response.reasonPhrase);
    }
  }
}
