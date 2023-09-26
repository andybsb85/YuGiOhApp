import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yu_gi_oh_project/models/monster.dart';

/// Documentation
///
/// Controlador para consumir api rest

class MonsterDbService {
  Future<List<Monster>> getData(String arquetipo) async {
    List<Monster> mosters = [];
    var url = Uri.https(
        'db.ygoprodeck.com', '/api/v7/cardinfo.php', {"archetype": arquetipo});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      for (var item in jsonData["data"]) {
        // Monster monster = Monster.fromMap(item);
        //if (Services().isBanned(monster))
        mosters.add(Monster.fromJson(item));
      }
    }
    return mosters;
  }
}
