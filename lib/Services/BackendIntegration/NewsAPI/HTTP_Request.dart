import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapp_news/Services/BackendIntegration/NewsAPI/API_Keys.dart';

GetNewsModel getNewsModel = GetNewsModel();

Future<List<dynamic>> fetchNews() async {
  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/top-headlines?country=${getNewsModel.countryId}&apiKey=${getNewsModel.apiKey}'),
  );

  if (response.statusCode == 200) {
    getNewsModel.jsonResponse = jsonDecode(response.body);
    getNewsModel.articlesData = getNewsModel.jsonResponse['articles'] as List;
    return getNewsModel.articlesData.take(30).toList();
  } else {
    throw Exception('Failed to load articles');
  }
}
