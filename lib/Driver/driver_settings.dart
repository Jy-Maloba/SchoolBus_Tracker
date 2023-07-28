import 'package:flutter/material.dart';

class DriverSettings extends StatefulWidget {
  const DriverSettings({Key? key}) : super(key: key);

  @override
  State<DriverSettings> createState() => _DriverSettingsState();
}

class _DriverSettingsState extends State<DriverSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
