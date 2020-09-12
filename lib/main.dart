import 'dart:io' as Io;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'providers/articles_dao.dart' as dao;

import 'models/article.dart';

void main() {
  runApp(ChristianWeavesDotComApp());
}

class ChristianWeavesDotComApp extends StatefulWidget {
  ChristianWeavesDotComApp({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  @override
  void initState() {
    super.initState();
    articles = grabAllArticles();
  }

  List<Article> articles = [];

  Image getImage(img64) {
    final decodedBytes = base64Decode(img64);
    return Image.memory(
      decodedBytes,
      width: 75,
      height: 75,
    );
  }

  grabFeatured() {
    dao.Articles().fetchFeaturedArticle().then((value) => print(value.title));
  }

  grabAllArticles() {
    dao.Articles().fetchAllArticles().then((value) => {
          value.forEach((element) {
            articles.add(element);
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Christan Weaves')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 75,
            child: Card(
              child: Text('Header'),
              elevation: 5,
              color: Colors.blue[200],
            ),
          ),
          Column(
            children: articles.map((article) {
              return Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5),
                      child: getImage(article.icon),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            article.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            article.subtitle,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
          Column(
            children: [
              RaisedButton(
                child: Text("Rock & Roll"),
                onPressed: grabFeatured,
              ),
            ],
          )
        ],
      ),
    );
  }
}
