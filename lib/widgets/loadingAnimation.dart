import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlareActor(
      'assets/Loader.flr',
      alignment: Alignment.center,
      fit: BoxFit.contain,
      animation: 'Untitled',
    );
  }
}
