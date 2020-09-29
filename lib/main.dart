import 'package:flutter/material.dart';

import './widgets/articleList.dart';
import './widgets/bannerCard.dart';
import './globals.dart' as global;

void main() {
  runApp(ChristianWeavesDotComApp());
}

class ChristianWeavesDotComApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(global.siteTitle),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              BannerCard(),
              Expanded(
                child: Container(
                  child: ArticleList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
