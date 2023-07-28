import 'package:flutter/material.dart';

class DriverMessages extends StatefulWidget {
  const DriverMessages({Key? key}) : super(key: key);

  @override
  State<DriverMessages> createState() => _DriverMessagesState();
}

class _DriverMessagesState extends State<DriverMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
