import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:silver_printings/screens/screens.dart';
import 'package:silver_printings/utils/utils.dart';
import 'package:silver_printings/widgets/widgets.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: AnimatedContainer(
                duration: Duration(milliseconds: 700),
                child: Column(
                  children: [
                    Container(
                        height: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                            child: Column(
                              children: [
                                Logo(
                                  font: 36.0,
                                ),
                                const SizedBox(height: 15.0),
                                Center(
                                    child: Text("LOGIN",
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold)))
                              ],
                            ),
                          ),
                        )),
                    Card(
                      child: Container(
                          width:
                              ScreenSize().getScreenSize(context).width * 0.9,
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
                          child: Column(
                            children: [
                              InputBox(
                                  hintText: 'Enter your name...',
                                  icon: LineIcons.userCircle,
                                  isPassword: false),
                              InputBox(
                                  hintText: 'email address...',
                                  icon: CommunityMaterialIcons.email_box,
                                  isPassword: false),
                              const SizedBox(
                                height: 10.0,
                              ),
                              TextButton(
                                  onPressed: () => Get.to(() => SignUp()),
                                  child: Text(
                                      "Dont' have an account? Sign Up there!",
                                      style: TextStyle(
                                          color: Colors.cyan,
                                          fontWeight: FontWeight.bold))),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                    height: 45.0,
                                    width: 140.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        gradient: Palette.light_gradient),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Login",
                                            style: TextStyle(
                                                fontSize: 22.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        Icon(CommunityMaterialIcons.login,
                                            color: Colors.white),
                                      ],
                                    )),
                              )
                            ],
                          )),
                    ),
                  ],
                ))),
        bottomSheet: Padding(
          padding: const EdgeInsets.fromLTRB(120.0, 5.0, 120.0, 30.0),
          child: Logo(font: 25.0),
        ),
      ),
    );
  }
}
