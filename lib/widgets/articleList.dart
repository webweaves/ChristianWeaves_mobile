import 'package:flutter/material.dart';

import '../providers/api.dart' as api;
import 'articleCard.dart';
import 'loadingAnimation.dart';

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: api.articles(),
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: LoadingAnimation(),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return ArticleCard(
                    snapshot.data[index].title,
                    snapshot.data[index].subtitle,
                    snapshot.data[index].icon,
                  );
                });
          }
        },
      ),
    );
  }
}
