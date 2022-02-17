import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:just_chat/constans.dart/Strings.dart';
import 'package:just_chat/models/news_model.dart';

class ApiManager {
  Future<List<NewsModel>> getNewsData() async {
    var client = http.Client();
    var newsModel;
    try {
      var response = await client.get(Uri.parse(Strings().url), headers: {
        'x-rapidapi-host': 'newsx.p.rapidapi.com',
        'x-rapidapi-key': 'a5cd5b1941msh8dca192a9110fcap15012djsn5db1497e094c'
      });
      /* Uri.parse(Strings().url),
        headers: {
          'x-rapidapi-host': 'newsx.p.rapidapi.com',
          'x-rapidapi-key': 'a5cd5b1941msh8dca192a9110fcap15012djsn5db1497e094c'
        }, */
      List data = json.decode(response.body);
      //print(data);
      return data.map((e) => NewsModel.fromJson(e)).toList();
    } catch (e) {
      print(e.toString());
      return newsModel;
    }
  }
}
