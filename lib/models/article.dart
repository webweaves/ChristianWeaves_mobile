import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class Article extends StatefulWidget {
  final int id;
  final String title;
  final String subtitle;
  final String body;
  final DateTime dateAdded;
  final bool featured;
  final bool archived;
  final String icon;
  final bool deleted;
  final bool hidden;
  final bool draft;

  const Article(
      {@required this.id,
      @required this.title,
      @required this.subtitle,
      this.body,
      this.dateAdded,
      this.featured,
      this.archived,
      this.icon,
      this.deleted,
      this.hidden,
      this.draft});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      icon: json['icon'],
    );
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
