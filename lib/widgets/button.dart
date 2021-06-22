import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onTappCallback;
  final IconData icon;
  final Color color;
  final String message;

  const Button(
      {Key key, this.onTappCallback, this.icon, this.message, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45.0,
        width: 130.0,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
        child: GestureDetector(
          onTap: onTappCallback,
          child: Card(
              color: color.withOpacity(0.6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(icon, color: color),
                  Text(message, style: TextStyle(color: Colors.white70)),
                ],
              )),
        ));
  }
}
