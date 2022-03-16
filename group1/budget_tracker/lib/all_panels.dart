import 'package:flutter/material.dart';
import 'form_panel.dart';

class AllPanels extends StatelessWidget {
  const AllPanels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      child: Center(
        child: Container(
          color: Colors.cyan,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //Form Screen
              Column(children: <Widget>[
                Expanded(child: Container(width: 400, child: FormScreen())),
                Container(
                  height: 150,
                  width: 400,
                  color: Colors.black,
                ),
              ]),
              GraphPanels(),
            ],
          ),
        ),
      ),
    );
  }
}

class GraphPanels extends StatelessWidget {
  const GraphPanels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: Column(
      children: <Widget>[
        Expanded(
            child: Container(
          color: Colors.amber,
        )),
        Expanded(
            child: Container(
          color: Colors.blue,
        )),
      ],
    ));
  }
}
