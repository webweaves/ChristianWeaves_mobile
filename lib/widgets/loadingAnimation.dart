import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'dart:async';

import '../globals.dart' as globals;

class LoadingAnimation extends StatefulWidget {
  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  Timer _timer;
  String _theText = globals.siteTitle;

  bool _loadingVisible = false;

  _LoadingAnimationState() {
    _timer = new Timer(const Duration(milliseconds: 0), () {
      setState(() {
        _loadingVisible = true;
      });
    });
    _timer = new Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        _loadingVisible = false;
      });
    });
    _timer = new Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        _loadingVisible = true;
        _theText = "Loading....";
      });
    });
    _timer = new Timer(const Duration(milliseconds: 9000), () {
      setState(() {
        _loadingVisible = false;
      });
    });
    _timer = new Timer(const Duration(milliseconds: 10000), () {
      setState(() {
        _loadingVisible = true;
        _theText = "Problem connecting!";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 50,
            color: Colors.blue[100],
            child: Center(
              child: AnimatedOpacity(
                opacity: _loadingVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Text(
                  _theText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
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
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
