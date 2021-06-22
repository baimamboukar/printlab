import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class GenderRadio extends StatefulWidget {
  const GenderRadio({
    Key key,
    this.icon,
  }) : super(key: key);
  final IconData icon;
  @override
  _GenderRadioState createState() => _GenderRadioState();
}

class _GenderRadioState extends State<GenderRadio> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isActive = !isActive),
      child: CircleAvatar(
        backgroundColor: isActive == true ? Colors.cyan : Colors.grey.shade200,
        child: Center(child: Icon(widget.icon)),
        radius: 20.0,
      ),
    );
  }
}
