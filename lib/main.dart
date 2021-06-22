import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:silver_printings/providers/auth_providers.dart';
import 'package:silver_printings/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PrintLab',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          textTheme: GoogleFonts.rulukoTextTheme(Theme.of(context).textTheme)),
      home: Root(),
    );
  }
}

class Root extends ConsumerWidget {
  const Root({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authState = watch(authStateProvider);
    return _authState.when(data: (user) {
      return Home();
    }, loading: () {
      return Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      ));
    }, error: (_, __) {
      return Scaffold(
          body: Center(
        child: Text("Error while loading..."),
      ));
    });
  }
}
