import 'package:flutter/material.dart';

class SerigraphyOption extends StatefulWidget {
  bool isSelected = false;
  String name;
  IconData icon;
  SerigraphyOption({Key key}) : super(key: key);

  @override
  _SerigraphyOptionState createState() => _SerigraphyOptionState();
}

class _SerigraphyOptionState extends State<SerigraphyOption> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      color: widget.isSelected ? Colors.cyan.shade200 : Colors.white,
      width: 150.0,
      child: Center(child: Icon(widget.icon, size: 58.0)),
    ));
  }
}
