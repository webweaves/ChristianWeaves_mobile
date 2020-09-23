import 'package:ChristianWeaves_mobile/widgets/articleList.dart';
import 'package:flutter/material.dart';

import 'widgets/bannerCard.dart';

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
          title: Text('Christian Weaves'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              BannerCard(),
              Container(
                height: 460,
                child: ArticleList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
