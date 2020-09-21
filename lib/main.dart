import 'widgets/articleCard.dart';
import 'featuredArticleCard.dart';
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

class _HomePageState extends State<ChristianWeavesDotComApp> {
  @override
  void initState() {
    super.initState();
    //articles = grabAllArticles();
  }

  final List<Article> _articles = [
    Article(id: 1, title: 'Title Article1', subtitle: 'Subtitle Article1'),
    Article(id: 2, title: 'Title Article2', subtitle: 'Subtitle Article2'),
  ];

  grabFeatured() {
    dao.Articles().fetchFeaturedArticle().then((value) => print(value.title));
  }

  grabAllArticles() {}

  @override // dao.Articles().fetchAllArticles().then((value) => {
  //       value.forEach((element) {
  //         articles.add(element);
  //       })
  //     });
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Christian Weaves'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FeaturedArticleCard(new Article(
              id: 1,
              title: 'Test',
              subtitle: 'Test',
            )),
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
      ),
    );
  }
}
