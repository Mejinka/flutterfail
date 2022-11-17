import 'dart:convert';

import 'package:http/http.dart';

import '../entity/cep.dart';

class CepService {
  Future<Cep> getCep(String cp) async {
    Response response =
        await get(Uri.parse('https://viacep.com.br/ws/$cp/json/'));
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return Cep.fromJson(jsonDecode(response.body));
  }
}
