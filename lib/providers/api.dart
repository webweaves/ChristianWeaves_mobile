import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/article.dart';

const urlPrefix = 'https://scottfreeit.com/rest/';

Future<List<Article>> articles() async {
  final url = urlPrefix + 'articles/getAllArticles';
  final body = await _fetchData(url);
  return (json.decode(body) as List)
      .map<Article>((a) => Article.fromJson(a))
      .where((a) => a != null) // filter out nulls
      .toList();
}

Future<Article> fetchFeaturedArticle() async {
  final response = await http.get(urlPrefix + '/articles/getFeatured');
  if (response.statusCode == 200) {
    return Article.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
      'Invalid response ${response.statusCode}',
      uri: Uri.parse(urlPrefix + '/articles/getFeatured'),
    );
  }
}

/// Fetches data from a url over http
Future<String> _fetchData(String url) async {
  final res = await http.get(url);

  if (res.statusCode != 200) {
    print('Error ${res.statusCode}: $url');
    throw HttpException(
      'Invalid response ${res.statusCode}',
      uri: Uri.parse(url),
    );
  }
  return res.body;
}
