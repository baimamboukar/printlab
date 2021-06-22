import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:silver_printings/utils/utils.dart';

class Service extends StatelessWidget {
  const Service(
      {Key key,
      this.context,
      this.service_name,
      this.button_message,
      this.destination,
      this.service_icon})
      : super(key: key);
  final BuildContext context;
  final String service_name;
  final IconData service_icon;
  final String button_message;
  final Widget destination;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => destination),
      child: Container(
          height: ScreenSize().getScreenSize(context).height * 0.2,
          width: ScreenSize().getScreenSize(context).width * 0.45,
          decoration: BoxDecoration(gradient: Palette.light_gradient),
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(service_name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    )),
                Center(
                    child: Icon(service_icon, size: 54.0, color: Colors.cyan)),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      LineIcons.arrowCircleRight,
                      color: Colors.cyan,
                    ))
              ],
            ),
          ))),
    );
  }
}
