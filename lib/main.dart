import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'providers/articles.dart';

void main() {
  runApp(ChristianWeavesDotComApp());
}

class ChristianWeavesDotComApp extends StatelessWidget {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Christian Weaves App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TheHomePage(title: 'Christian Weaves dot com'),
    );
  }
}

class TheHomePage extends StatefulWidget {
  TheHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TheHomePageState createState() => _TheHomePageState();
}

class _TheHomePageState extends State<TheHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text('Test button'),
            onPressed: () => print(Articles().getFeaturedArticle()),
          )
        ],
      ),
    );
  }
}
