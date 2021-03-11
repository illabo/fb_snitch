import 'package:fb_snitch_platform_interface/fb_snitch_platform_interface.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final snitchInstance = FbSnitchPlatform.instance;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void initPlatformState() {
    snitchInstance.initPixel('000000000000000');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(children: [
            Text('Snitch: $snitchInstance'),
            MaterialButton(
              onPressed: () {
                snitchInstance.trackCustom(
                  "CustomEvent",
                  {},
                );
              },
              child: Text('Test track'),
            )
          ]),
        ),
      ),
    );
  }
}
