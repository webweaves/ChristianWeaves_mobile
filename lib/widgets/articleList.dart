import 'dart:convert';

import 'package:flutter/material.dart';

import 'detailedArticle.dart';
import 'loadingAnimation.dart';
import '../providers/api.dart' as api;

class ArticleList extends StatelessWidget {
  Image getImage(img64) {
    final decodedBytes = base64Decode(img64);
    return Image.memory(
      decodedBytes,
      width: 65,
      height: 65,
    );
  }

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
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    backgroundImage: getImage(snapshot.data[index].icon).image,
                  ),
                  title: Text(snapshot.data[index].title),
                  subtitle: Text(snapshot.data[index].subtitle),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) =>
                            DetailedArticle(snapshot.data[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
