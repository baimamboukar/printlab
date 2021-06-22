import 'dart:ui';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:get/get.dart';
import 'package:silver_printings/utils/utils.dart';
import 'package:silver_printings/screens/screens.dart';
import 'package:silver_printings/widgets/widgets.dart';

List<Design> topDesigns = [
  Design(imagePath: "assets/icons/electron.png", name: "Tshirt"),
  Design(imagePath: "assets/icons/linux.png", name: "Design"),
  Design(imagePath: "assets/icons/linux.png", name: "Design"),
  Design(imagePath: "assets/icons/go.png", name: "Card"),
  Design(imagePath: "assets/icons/linux.png", name: "Design"),
  Design(imagePath: "assets/icons/linux.png", name: "Design"),
  Design(imagePath: "assets/icons/ember.png", name: "Wedding Card"),
  Design(imagePath: "assets/icons/linux.png", name: "Design"),
  Design(imagePath: "assets/icons/electron.png", name: "Tshirt"),
  Design(imagePath: "assets/icons/linux.png", name: "Design"),
  Design(imagePath: "assets/icons/ionic.png", name: "Birthday"),
];

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          drawer: CustomDrawer(),
          appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(LineIcons.tasks, color: Colors.white),
                onPressed: () => _scaffoldKey.currentState.openDrawer()),
            title: Logo(font: 18.5),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(CommunityMaterialIcons.bell_ring,
                      size: 18.0, color: Colors.white),
                  onPressed: () => Get.to(() => Notifications()))
            ],
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Top Designs"),
                      OutlinedButton.icon(
                        onPressed: () => Get.to(() => Explore()),
                        icon: Icon(LineIcons.expand),
                        label: Text("Explore All",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.cyan)),
                      )
                    ],
                  )),
              Container(
                height: ScreenSize().getScreenSize(context).height * 0.25,
                child: ListView.builder(
                  itemCount: topDesigns.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return topDesigns[index];
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Service(
                      context: context,
                      service_icon: LineIcons.print,
                      service_name: "Quality Printings",
                      button_message: "Order Printing",
                      destination: Printing(),
                    ),
                    Service(
                      context: context,
                      service_icon: LineIcons.newspaper,
                      service_name: "Flyers-Brochures",
                      button_message: "Order design",
                      destination: FlutterLogo(),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Service(
                      context: context,
                      service_icon: LineIcons.tShirt,
                      service_name: "Serigraphy",
                      button_message: "Order design",
                      destination: Serigraphy(),
                    ),
                    Service(
                      context: context,
                      service_icon: Icons.card_membership,
                      service_name: "Cards",
                      button_message: "Order design",
                      destination: Cards(),
                    )
                  ],
                ),
              )
            ],
          )),
          floatingActionButton: FloatingActionButton(
              onPressed: () => Get.to(Chat()),
              child: Icon(LineIcons.facebookMessenger,
                  color: Colors.white, size: 32.0))),
    );
  }
}
