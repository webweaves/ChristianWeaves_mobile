import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      child: Card(
        child: Text("SFIT"),
        elevation: 5,
        color: Colors.blue[200],
      ),
    );
  }
}
