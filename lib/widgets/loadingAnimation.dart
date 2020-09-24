import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.blue[100],
            child: Center(
              child: Text("Scott Free IT!"),
            ),
          ),
          Container(
              height: 300,
              color: Colors.blue[100],
              child: FlareActor(
                'assets/Loader.flr',
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: 'Untitled',
              ))
        ]);
  }
}
