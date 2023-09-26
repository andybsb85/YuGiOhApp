import 'package:flutter/material.dart';
import 'package:yu_gi_oh_project/main.dart';
import 'package:yu_gi_oh_project/view/arquetipos.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      // hint: const Text('Selecciona Arquetipo'),
      dropdownColor: const Color.fromARGB(255, 208, 178, 232),
      value: dropdownValue,
      icon: Container(
        padding: const EdgeInsets.fromLTRB(120, 0, 0, 10),
        child: const Icon(
          Icons.arrow_downward,
          color: Color.fromARGB(255, 60, 46, 82),
          size: 28,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      elevation: 16,
      style:
          const TextStyle(color: Color.fromARGB(255, 60, 46, 82), fontSize: 20),
      underline: Container(
        height: 2,
        color: const Color.fromARGB(255, 60, 46, 82),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          // const Color.fromARGB(12, 12, 12, 12);
          dropdownValue = value!;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Arquetipos(arquetipo: dropdownValue),
            ),
          );
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
