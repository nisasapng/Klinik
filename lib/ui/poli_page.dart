import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';   
import 'poli_item.dart'; 
import 'poli_form.dart'; 

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  List<Poli> poliList = [
    Poli(namaPoli: "Poli Anak"),
    Poli(namaPoli: "Poli Kandungan"),
    Poli(namaPoli: "Poli Gigi"),
    Poli(namaPoli: "Poli THT"),
  ];

  void _addPoli(Poli poli) {
    setState(() {
      poliList.add(poli);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Poli"),   
        actions: [   
          GestureDetector(   
            child: const Icon(Icons.add),   
            onTap: () async {
              final newPoli = await Navigator.push<Poli>(
                context, 
                MaterialPageRoute(builder: (context) => PoliForm())
              );
              if (newPoli != null) {
                _addPoli(newPoli);
              }
            },   
          )   
        ],   
      ),
      body: ListView.builder(
        itemCount: poliList.length,
        itemBuilder: (context, index) {
          final poli = poliList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => PoliDetail(poli: poli))
              );
            },
            child: PoliItem(poli: poli),
          );
        },
      ),
    );
  }
}
