import 'package:ChristianWeaves_mobile/models/article.dart';
import 'package:flutter/material.dart';

class FeaturedArticleCard extends StatelessWidget {
  final Article _featuredArticle;

  FeaturedArticleCard(this._featuredArticle);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      child: Card(
        child: Text(_featuredArticle.title),
        elevation: 5,
        color: Colors.blue[200],
      ),
    );
  }
}
