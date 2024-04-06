import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapp_news/Services/BackendIntegration/NewsAPI/API_Keys.dart';
import '../ObjectBox/ObjectBox_Database.dart';
import '../ObjectBox/ObjectBox_Model.dart';

GetNewsModel getNewsModel = GetNewsModel();

Future<List<dynamic>> fetchNews() async {
  final box = await Database.openBox();

  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/top-headlines?country=${getNewsModel.countryId}&apiKey=${getNewsModel.apiKey}'),
  );

  if (response.statusCode == 200) {
    getNewsModel.jsonResponse = jsonDecode(response.body);
    getNewsModel.articlesData = getNewsModel.jsonResponse['articles'] as List;
    for (var article in getNewsModel.articlesData) {
      box.put(Article(
        id: article['id'],
        urlToImage: article['urlToImage'],
        title: article['title'],
        description: article['description'],
      ));
    }
    return getNewsModel.articlesData.take(30).toList();
  } else {
    throw Exception('Failed to load articles');
  }
}
