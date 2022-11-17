import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_app/parking_spot_model.dart';

import '../service/cep_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CepService cepService = CepService();

  TextEditingController textEditingController = TextEditingController();

  ///jjj
  bool fetch = false;

  List<dynamic> items = [];

  List<dynamic> matriculas = [];

  var dropItem = '';

  List<dynamic> produtos = ['areia', 'cimento'];

  Future<void> getItems() async {
    Response response = await get(
      Uri.parse('http://192.168.1.96:8080/parking-spot'),
    );
    setState(() {
      Map<String, dynamic> map = jsonDecode(response.body);
      List<dynamic> lista = map['content'];
      for (final item in lista) {
        matriculas.add(item['matricula_car'].toString());
        //produtos.add(item['produto']);
        // var matcar = items.id;
        // items = jsonDecode(response.body);
        // dropItem = items.first;
        // fetch = true;
      }
      print(matriculas);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TEST DROPDOWN'),
        actions: [
          IconButton(
            onPressed: () {}, //=> getItems(),
            icon: const Icon(Icons.arrow_downward_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: textEditingController,
          ),
          Visibility(
            visible: fetch,
            child: DropdownButton(
                value: dropItem,
                items: matriculas?.map((dynamic item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropItem = value!.toString();
                  });
                }),
          ),
        ],
      ),
    );
  }
}
