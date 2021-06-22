import 'package:flutter/material.dart';
import 'package:silver_printings/widgets/widgets.dart';

List<Design> designs = [
  Design(imagePath: "assets/icons/ember.png", name: "Wedding Card"),
  Design(imagePath: "assets/icons/linux.png", name: "Design"),
  Design(imagePath: "assets/icons/go.png", name: "Card"),
  Design(imagePath: "assets/icons/electron.png", name: "Tshirt"),
  Design(imagePath: "assets/icons/linux.png", name: "Design"),
  Design(imagePath: "assets/icons/ember.png", name: "Wedding Card"),
  Design(imagePath: "assets/icons/linux.png", name: "Design"),
  Design(imagePath: "assets/icons/electron.png", name: "Tshirt"),
  Design(imagePath: "assets/icons/linux.png", name: "Design"),
  Design(imagePath: "assets/icons/electron.png", name: "Tshirt"),
  Design(imagePath: "assets/icons/ionic.png", name: "Birthday"),
  Design(imagePath: "assets/icons/ember.png", name: "Wedding Card"),
  Design(imagePath: "assets/icons/ember.png", name: "Wedding Card"),
  Design(imagePath: "assets/icons/linux.png", name: "Design"),
  Design(imagePath: "assets/icons/go.png", name: "Card"),
  Design(imagePath: "assets/icons/electron.png", name: "Tshirt"),
  Design(imagePath: "assets/icons/linux.png", name: "Design"),
  Design(imagePath: "assets/icons/ember.png", name: "Wedding Card"),
  Design(imagePath: "assets/icons/linux.png", name: "Design"),
  Design(imagePath: "assets/icons/electron.png", name: "Tshirt"),
  Design(imagePath: "assets/icons/linux.png", name: "Design"),
  Design(imagePath: "assets/icons/electron.png", name: "Tshirt"),
  Design(imagePath: "assets/icons/ionic.png", name: "Birthday"),
  Design(imagePath: "assets/icons/ember.png", name: "Wedding Card"),
];

class Explore extends StatefulWidget {
  const Explore({Key key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Explore")),
      body: GridView.builder(
          itemCount: designs.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return designs[index];
          }),
    );
  }
}
