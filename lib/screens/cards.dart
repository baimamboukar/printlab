import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  const Cards({Key key}) : super(key: key);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cards")),
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
