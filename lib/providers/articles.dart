import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import '../models/article.dart';

class Articles with ChangeNotifier {
  List<Article> _articles = [
    Article(id: '1', title: 'Title Article1', subtitle: 'Subtitle Article1'),
    Article(id: '2', title: 'Title Article2', subtitle: 'Subtitle Article2'),
  ];

  List<Article> get articles {
    return [..._articles];
  }
}
