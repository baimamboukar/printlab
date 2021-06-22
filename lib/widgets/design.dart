import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:silver_printings/utils/utils.dart';
import 'package:silver_printings/widgets/widgets.dart';

class Design extends StatefulWidget {
  final String name;
  final String imagePath;

  const Design({Key key, this.name, this.imagePath}) : super(key: key);

  @override
  _DesignState createState() => _DesignState();
}

class _DesignState extends State<Design> {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openColor: Colors.cyan.shade100,
      middleColor: Colors.cyan,
      closedBuilder: (BuildContext context, void Function() action) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18.0),
                boxShadow: [
                  BoxShadow(blurRadius: 0.5, offset: Offset.zero),
                ]),
            height: ScreenSize().getScreenSize(context).height * 0.15,
            width: ScreenSize().getScreenSize(context).width * 0.3,
            child: Container(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(widget.name)),
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage(widget.imagePath)))),
          ),
        );
      },
      openBuilder:
          (BuildContext context, void Function({Object returnValue}) action) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                  ),
                  child: Card(
                    color: Colors.cyan.shade100,
                    child: Container(
                        height: 250.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.imagePath)))),
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: Container(
            height: 60.0,
            color: Colors.cyan,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text("Order this Design")],
              ),
            ),
          ),
        );
      },
    );
  }
}
