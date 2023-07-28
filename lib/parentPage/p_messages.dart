import 'package:flutter/material.dart';

class ParentMessages extends StatefulWidget {
  const ParentMessages({Key? key}) : super(key: key);

  @override
  State<ParentMessages> createState() => _ParentMessagesState();
}

class _ParentMessagesState extends State<ParentMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: Text('Messages'),
      ),
    );
  }
}
