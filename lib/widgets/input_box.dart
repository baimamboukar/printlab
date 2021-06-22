import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  const InputBox(
      {Key key, this.hintText, this.icon, this.isPassword, this.controller})
      : super(key: key);
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;

  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: TextFormField(
        obscureText: widget.isPassword,
        keyboardType: widget.isPassword
            ? TextInputType.visiblePassword
            : TextInputType.text,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.all(10.0),
          prefixIcon: Icon(widget.icon, color: Colors.cyan),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(28.0)),
        ),
      ),
    );
  }
}
