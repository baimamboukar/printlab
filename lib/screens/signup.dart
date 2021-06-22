import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:silver_printings/providers/auth_providers.dart';
import 'package:silver_printings/screens/screens.dart';
import 'package:silver_printings/utils/utils.dart';
import 'package:silver_printings/widgets/widgets.dart';

class SignUp extends ConsumerWidget {
  bool isMan, isWoman;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authServices = watch(authProvider);
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
                                    child: Text("SIGN UP",
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
                              top: 20.0, bottom: 35.0, left: 10.0, right: 10.0),
                          child: Form(
                            child: Column(
                              children: [
                                InputBox(
                                    controller: _nameController,
                                    hintText: 'Enter your name...',
                                    icon: LineIcons.userCircle,
                                    isPassword: false),
                                InputBox(
                                    controller: _emailController,
                                    hintText: 'email address...',
                                    icon: CommunityMaterialIcons.email_box,
                                    isPassword: false),
                                InputBox(
                                    controller: _phoneController,
                                    hintText: 'phone number...',
                                    icon: CommunityMaterialIcons.phone,
                                    isPassword: false),
                                InputBox(
                                    controller: _addressController,
                                    hintText: 'permanent address...',
                                    icon: LineIcons.addressBook,
                                    isPassword: false),
                                InputBox(
                                    controller: _passwordController,
                                    hintText: 'password...',
                                    icon: LineIcons.addressBook,
                                    isPassword: true),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GenderRadio(icon: LineIcons.male),
                                    Text("Male"),
                                    GenderRadio(icon: LineIcons.female),
                                    Text("Female"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextButton(
                                    onPressed: () => Get.to(() => Login()),
                                    child: Text(
                                        "Already have an account? Login there!",
                                        style: TextStyle(
                                            color: Colors.cyan,
                                            fontWeight: FontWeight.bold))),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Button(
                                      icon: LineIcons.googleLogo,
                                      message: "With Google",
                                      color: Colors.red,
                                      onTappCallback: () {
                                        print("lol");
                                      },
                                    ),
                                    Button(
                                      icon: LineIcons.facebook,
                                      message: "With Facebook",
                                      color: Colors.blue,
                                      onTappCallback: () {
                                        print("lol");
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _authServices.signUp(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          name: _nameController.text,
                                          phone: _phoneController.text,
                                          address: _addressController.text);
                                    },
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
                                            Text("Sign Up",
                                                style: TextStyle(
                                                    fontSize: 22.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Icon(CommunityMaterialIcons.login,
                                                color: Colors.white),
                                          ],
                                        )),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
                ))),
      ),
    );
  }
}
