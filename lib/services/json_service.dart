import 'dart:convert';

import 'package:http/http.dart' as http;

class JsonService {
  static String listeChampionUrl =
      "https://ddragon.leagueoflegends.com/cdn/13.6.1/data/en_US/champion.json";
  static String championDataUrl =
      "https://ddragon.leagueoflegends.com/cdn/13.6.1/data/en_US/champion/";

  static Future<List<String>> getListeChampion() async {
    final response = await http.get(Uri.parse(listeChampionUrl),
        headers: {'Access-Cross-Allow-Origin': '*'});
    final jsonData = jsonDecode(response.body);
    final List<String> champList = [];

    jsonData['data'].keys.forEach((champion) {
      champList.add(champion);
    });

    return champList;
  }

  static getChampionData(name) async {
    final response = await http.get(Uri.parse("${championDataUrl + name}.json"),
        headers: {'Access-Cross-Allow-Origin': '*'});
    final jsonData = jsonDecode(response.body);
    print(jsonData['data']);
    //#TODO: récupérer les données et les mettre comme il faut dans l'objet champion et tout et tout
  }
}
