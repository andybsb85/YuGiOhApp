import 'package:flutter/material.dart';
import 'package:yu_gi_oh_project/models/monster.dart';
import 'package:yu_gi_oh_project/widgets/background.dart';

class MostrarPersonaje extends StatelessWidget {
  final Monster monster;

  const MostrarPersonaje({
    Key? key,
    required this.monster,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Background(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          title: Text(monster.name as String),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: _mosterCard(monster),
                  )),
              SizedBox(height: 10),
              Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 140,
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: const Text(
                              'DESCRIPCION:',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Container(
                            width: 210,
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              monster.desc ?? 'No Especifica',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 140,
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: const Text(
                              'RACE:',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Container(
                            width: 210,
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              monster.race ?? 'No Especifica',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 140,
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: const Text(
                              'ATRIBUTO:',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Container(
                            width: 210,
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              monster.attribute ?? 'No Especifica',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 140,
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: const Text(
                              'ARCHETYPE:',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Container(
                            width: 210,
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              monster.archetype ?? 'No Especifica',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      )
    ]);
  }
}

Widget _mosterCard(Monster monster) {
  var list = monster.cardImages;
  String? url;
  //print(list.runtimeType); //returns List<dynamic>
  list?.map((e) {
    url = e.imageUrlCropped;
  }).toList();

  return Column(children: [
    const SizedBox(
      height: 20,
    ),
    Image(image: NetworkImage(url!)),
  ]);
}
