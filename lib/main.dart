import 'package:flutter/material.dart';
import 'providers/articles_dao.dart';

import 'models/article.dart';

void main() {
  runApp(ChristianWeavesDotComApp());
}

class ChristianWeavesDotComApp extends StatelessWidget {
  final List<Article> _articles = [
    Article(id: '1', title: 'Title Article1', subtitle: 'Subtitle Article1'),
    Article(id: '2', title: 'Title Article2', subtitle: 'Subtitle Article2'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Christan Weaves')),
      body: Column(
        children: <Widget>[
          Container(
            child: Card(
              child: Text('Bonza'),
            ),
          )
        ],
      ),
    );
  }
}
