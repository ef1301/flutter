import 'package:flutter/material.dart';
import 'package:budget_tracker/form_panel.dart';
import 'package:budget_tracker/all_panels.dart';

import 'login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login()
        /*Scaffold(
        //Visual scaffold
        appBar: AppBar(
          title: const Center(child: Text("Budget Tracker")),
        ),
        body: Center(
          //Centers child
          //child: AllPanels(),
          child: Login(),
        ),
      ),*/
        );
  }
}
