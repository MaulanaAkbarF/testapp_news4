import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapp_news/Services/BackendIntegration/NewsAPI/News_Model.dart';
import '../ObjectBox/ObjectBox_Database.dart';
import '../ObjectBox/ObjectBox_Model.dart';

GetNewsModel getNewsModel = GetNewsModel();
final objectBoxInstance = ObjectBoxInstance();

Future<void> fetchNews() async {
  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/top-headlines?country=${getNewsModel.countryId}&apiKey=${getNewsModel.apiKey}'),
  );

  if (response.statusCode == 200) {
    getNewsModel.jsonResponse = jsonDecode(response.body);
    getNewsModel.articlesData = getNewsModel.jsonResponse['articles'] as List;
    getNewsModel.articleList = getNewsModel.articlesData.take(30).toList();

    // await objectBoxInstance.init();
    // final database = await Database.create(objectBoxInstance.store);
    // for (var article in getNewsModel.articlesData) {
    //   database.saveArticle(
    //     Article(
    //       id: article['id'],
    //       title: article['title'] ?? '',
    //       description: article['description'] ?? '',
    //       urlToImage: article['urlToImage'] ?? '',
    //     ),
    //   );
    // }
  } else {
    throw Exception('Failed to load articles');
  }
}

Future<void> fetchTrendsNews() async {
  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/everything?q=${getNewsModel.content}&apiKey=${getNewsModel.apiKey}'),
  );

  if (response.statusCode == 200) {
    getNewsModel.jsonTrendsResponse = jsonDecode(response.body);
    getNewsModel.articlesTrendsData = getNewsModel.jsonTrendsResponse['articles'] as List;
    getNewsModel.articleTrendsList = getNewsModel.articlesTrendsData.take(30).toList();

    // await objectBoxInstance.init();
    // final database = await Database.create(objectBoxInstance.store);
    // for (var article in getNewsModel.articlesData) {
    //   database.saveArticle(
    //     Article(
    //       id: article['id'],
    //       title: article['title'] ?? '',
    //       description: article['description'] ?? '',
    //       urlToImage: article['urlToImage'] ?? '',
    //     ),
    //   );
    // }
  } else {
    throw Exception('Failed to load articles');
  }
}

Future<List<dynamic>> getNewsListData() async {
  await fetchNews();
  return getNewsModel.articleList ?? [];
}

Future<List<dynamic>> getTrendsNewsListData() async {
  await fetchTrendsNews();
  return getNewsModel.articleTrendsList ?? [];
}

Future<void> fetchNewsFromObjectBox() async {
  final database = await Database.create(objectBoxInstance.store);
  final articleEntities = database.getAllArticles();

  List<Map<String, dynamic>> articles = [];
  for (var entity in articleEntities) {
    articles.add({
      'id': entity.id,
      'title': entity.title,
      'description': entity.description,
      'urlToImage': entity.urlToImage,
    });
  }

  getNewsModel.articleListOffline = articles;
}
