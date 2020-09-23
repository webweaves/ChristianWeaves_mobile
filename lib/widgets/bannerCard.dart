import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Card(
        child: Image.asset('assets/images/background_small.png'),
        elevation: 5,
        color: Colors.blue[200],
      ),
    );
  }
}
