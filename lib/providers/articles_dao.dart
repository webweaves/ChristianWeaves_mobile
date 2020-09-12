import 'dart:async';
import 'dart:convert';
import '../models/article.dart';
import 'package:http/http.dart' as http;

class Articles {
  Future<Article> fetchFeaturedArticle() async {
    final response =
        await http.get('https://scottfreeit.com/rest/articles/getFeatured');
    if (response.statusCode == 200) {
      return Article.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load articles');
    }
  }

  Future<List<Article>> fetchAllArticles() async {
    const url = 'https://scottfreeit.com/rest/articles/getAllArticles';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Article> loadedArticles = [];
      extractedData.forEach((id, article) {
        loadedArticles.add(Article.fromJson(json.decode(article)));
      });
      return loadedArticles;
    } catch (error) {
      throw (error);
    }
  }
}
