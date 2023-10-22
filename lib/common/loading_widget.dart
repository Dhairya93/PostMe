import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  var _colorTween;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Set a duration
    );
    _colorTween = _animationController
        .drive(ColorTween(begin: Colors.blue, end: Colors.green));
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: _colorTween,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
