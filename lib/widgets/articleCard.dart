import 'package:flutter/material.dart';
import 'dart:convert';

class ArticleCard extends StatelessWidget {
  final String _icon;
  final String _title;
  final String _subtitle;

  ArticleCard(this._title, this._subtitle, this._icon);

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
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              child: getImage(_icon),
            ),
            Container(
              width: 275,
              margin: EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _subtitle,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
