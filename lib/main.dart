import 'package:flutter/material.dart';
import 'package:yu_gi_oh_project/widgets/background.dart';
import 'package:yu_gi_oh_project/widgets/dropdown.dart';

const List<String> list = <String>[
  'Alien',
  'Noble Knight',
  'Tainted Treasure',
  'Melodious',
  'Archfiend',
  'Elemental HERO',
  'Umi',
  'ABC'
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YU GI OH',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 63, 38, 105),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'YU GI OH APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Background(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Column(children: [
          const LogoYuGiOh(),
          Container(
            margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
            width: 350,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 220, 213, 213).withOpacity(0.85),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const DropdownButtonExample(),
          )
        ]
            //
            ),
        // ),
      ),
    ]);
  }
}
