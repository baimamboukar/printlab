import 'package:flutter/material.dart';

class Serigraphy extends StatefulWidget {
  const Serigraphy({Key key}) : super(key: key);

  @override
  _SerigraphyState createState() => _SerigraphyState();
}

class _SerigraphyState extends State<Serigraphy> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Serigraphy")),
      body: Stepper(
        currentStep: _currentStep,
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep = _currentStep - 1;
            });
          }
        },
        onStepContinue: () {
          if (_currentStep < 4) {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          }
        },
        steps: [
          Step(title: Text("Type"), content: Text("Choose Shirt or coffee")),
          Step(title: Text("Design"), content: Text("Choose Shirt or coffee")),
          Step(title: Text("Details"), content: Text("Choose Shirt or coffee")),
          Step(
              title: Text("Validate"), content: Text("Choose Shirt or coffee")),
        ],
      ),
    );
  }
}
