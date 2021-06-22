import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:silver_printings/providers/auth_providers.dart';
import 'package:silver_printings/utils/utils.dart';
import 'package:silver_printings/widgets/widgets.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authServices = watch(authProvider);
    return Container(
      width: ScreenSize().getScreenSize(context).width * 0.65,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(00.0),
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(child: Text("Silver Printings")),
                decoration: BoxDecoration(gradient: Palette.light_gradient),
              ),
              item("Account", LineIcons.userCircle, FlutterLogo()),
              item("Orders", LineIcons.tasks, FlutterLogo()),
              item("Notifications", LineIcons.bellAlt, FlutterLogo()),
              Spacer(),
              ListTile(
                  leading: Icon(LineIcons.alternateSignOut, color: Colors.cyan),
                  title: Text("Log out"),
                  onTap: () => _authServices.logOut()),
              Center(child: Logo(font: 20.0))
            ],
          ),
        ),
      ),
    );
  }
}

Widget item(String message, IconData icon, Widget destination) {
  return ListTile(
    leading: Icon(icon, color: Colors.cyan),
    title: Text(message),
    onTap: () => Get.to(() => destination),
  );
}
