import 'package:yu_gi_oh_project/models/monster.dart';

class Monsters {
  Monsters();

  static List<Monster> fromJsonList(List<dynamic> jsonList) {
    List<Monster> listaMounstros = [];
    // if(jsonList != null){
    for (var mounstro in jsonList) {
      final monster = Monster.fromJson(mounstro);
      listaMounstros.add(monster);
      //  }
    }
    return listaMounstros;
  }
}
