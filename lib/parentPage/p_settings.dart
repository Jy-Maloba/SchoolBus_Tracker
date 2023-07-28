import 'package:flutter/material.dart';

class ParentSettings extends StatefulWidget {
  const ParentSettings({Key? key}) : super(key: key);

  @override
  State<ParentSettings> createState() => _ParentSettingsState();
}

class _ParentSettingsState extends State<ParentSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: Text('Settings'),
      ),
    );
  }
}
