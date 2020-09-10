import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class Articles {
  Future<void> getFeaturedArticle() async {
    const url = 'https://url/rest/articles/getFeatured';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Article> loadedArticles = []; 
      extractedData.forEach((id, article) { 
        loadedArticles.add(Article(
          id:article.id,
          title:article.title,
          subtitle:article.subtitle,
        ));
      })
      print(json.decode(response.body));
    } catch (error) {
      throw (error);
    }
  }

  Future<void> getAllArticles() async {
    const url = 'https://url/rest/articles/getAllArticles';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Article> loadedArticles = []; 
      extractedData.forEach((id, article) { 
        loadedArticles.add(Article(
          id:article.id,
          title:article.title,
          subtitle:article.subtitle,
        ));
      })
      print(json.decode(response.body));
    } catch (error) {
      throw (error);
    }
  }
}
