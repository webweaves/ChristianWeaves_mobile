import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

import '../models/article.dart';

class DetailedArticle extends StatelessWidget {
  final Article article;

  DetailedArticle(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(article.title),
        ),
        body: Container(
            child: Card(
          child: Html(data: """
                <div>Follow<a class='sup'><sup>pl</sup></a> 
                  Below hr
                    <b>Bold</b>
                <h1>what was sent down to you from your Lord</h1>, 
                and do not follow other guardians apart from Him. Little do 
                <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>
                """),
        )));
  }
}
