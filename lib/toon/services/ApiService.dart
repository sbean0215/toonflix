import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/toon/model/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webttonInstances = [];

    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webttonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webttonInstances;
    }

    throw Error();
  }
}
