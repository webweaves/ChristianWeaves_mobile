import 'package:flutter/material.dart';

import '../models/article.dart';
import 'articleCard.dart';

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  final List<Article> _articles = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _articles.map((article) {
        return ArticleCard(
          article.icon,
          article.title,
          article.subtitle,
        );
      }).toList(),
    );
  }
}
