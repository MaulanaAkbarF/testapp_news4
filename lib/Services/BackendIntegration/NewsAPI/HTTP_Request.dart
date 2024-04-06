import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapp_news/Services/BackendIntegration/NewsAPI/API_Keys.dart';

GetNewsModel getNewsModel = GetNewsModel();

void fetchTrendingArticles() async {
  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/everything?q=trending&apiKey=${getNewsModel.apiKey}'),
  );

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    var articles = jsonResponse['articles'];
    for (var article in articles) {
      print(article['title']);
    }
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
