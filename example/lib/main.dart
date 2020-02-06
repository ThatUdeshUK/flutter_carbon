import 'package:flutter/material.dart';
import 'package:flutter_carbon/flutter_carbon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Carbon Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter Carbon Gallary")),
        body: Column(
          children: <Widget>[
            Button(
              onPressed: () {
                print("Button pressed");
              },
              text: "Button",
              size: ButtonSize.FullBleed,
            )
          ],
        ),
      ),
    );
  }
}
