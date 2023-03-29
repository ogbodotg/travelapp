import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:itravel/model/data_model.dart';

class DataServices {
  String baseUrl = "http://ogbodotg.com/api";

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/locations';

    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);

        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
