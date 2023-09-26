import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yu_gi_oh_project/controllers/monsterDbService.dart';
import 'package:yu_gi_oh_project/models/cardImage.dart';
import 'package:yu_gi_oh_project/models/monster.dart';
import 'package:yu_gi_oh_project/view/mostrarPersonaje.dart';
import 'package:yu_gi_oh_project/widgets/background.dart';

class Arquetipos extends StatefulWidget {
  // const Arquetipos({super.key});
  final String arquetipo;

  const Arquetipos({
    Key? key,
    required this.arquetipo,
  }) : super(key: key);

  @override
  State<Arquetipos> createState() => ArquetiposState();
}

class ArquetiposState extends State<Arquetipos> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // String titulo;
      const Background(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          title: const Text('Listado de Personajes'),
        ),
        body: FutureBuilder(
          future: MonsterDbService().getData(widget.arquetipo),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Monster> monsters = snapshot.data ?? [];
              return Column(children: [
                const SizedBox(height: 100),
                CarouselSlider.builder(
                    itemCount: monsters.length,
                    itemBuilder: (context, index, getRealIndex) => Container(
                          child: InkWell(
                            onTap: () {
                              monsters[index].copyWith();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MostrarPersonaje(
                                      monster: monsters[index]),
                                ),
                              );
                            },
                            child: _mosterCard(monsters[index]),
                          ),
                        ),
                    options: CarouselOptions(
                      height: 600,
                      autoPlay: true,
                      autoPlayCurve: Curves.easeInOut,
                      enlargeCenterPage: true,
                      //enlargeFactor: 0.3,
                      autoPlayInterval: const Duration(seconds: 3),
                      scrollDirection: Axis.horizontal,
                    ))
              ]);
              // });
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text("Error");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }, //Builder
        ),
      ),
    ]);
  }
}

class CarouselImages extends StatelessWidget {
  final CardImage carrouselImages;
  const CarouselImages({Key? key, required this.carrouselImages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {},
          //child: _mosterCard(monsters[index]),
        ),
      ),
    );
  }
}

Widget _mosterCard(Monster monster) {
  var list = monster.cardImages;
  String? url;
  //print(list.runtimeType); //returns List<dynamic>
  list?.map((e) {
    url = e.imageUrl;
  }).toList();

  return Column(children: [
    const SizedBox(
      height: 20,
    ),
    Image(image: NetworkImage(url!)),
  ]);
}
