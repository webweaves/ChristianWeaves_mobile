import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';

import '../models/article.dart';

class DetailedArticle extends StatelessWidget {
  //apply certain regex to make the web content more ledgible
  String _parseHtml(String body) {
    RegExp exp = RegExp(r"<code[^>]*>", multiLine: true, caseSensitive: true);
    body = body.replaceAll(exp, '');
    body = body.replaceAll(new RegExp(r"&gt;", multiLine: true), '>');
    body = body.replaceAll(new RegExp(r"&lt;", multiLine: true), '<');
    return body;
  }

  final Article article;

  DetailedArticle(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Text(
                      this.article.subtitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  child: Center(
                    child: Html(
                      data: _parseHtml(this.article.body),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
