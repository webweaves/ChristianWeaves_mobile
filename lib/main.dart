import 'package:flutter/material.dart';

import 'models/article.dart';
import 'providers/articles_dao.dart' as dao;
import 'widgets/articleCard.dart';
import 'widgets/featuredArticleCard.dart';

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
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FeaturedArticleCard(
                _articles[0],
              ),
              Container(
                child: FutureBuilder(
                  future: dao.Articles().fetchAllArticles(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Center(
                          child: Text("Loading...."),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return ListTile(
                              title: Text(snapshot.data[index].title),
                            );
                          });
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
