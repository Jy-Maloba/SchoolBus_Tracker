import 'package:flutter/material.dart';

class DriverChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUID;
  const DriverChatPage({Key? key, required this.receiverUID, required this.receiverUserEmail}) : super(key: key);

  @override
  State<DriverChatPage> createState() => _DriverChatPageState();
}

class _DriverChatPageState extends State<DriverChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
