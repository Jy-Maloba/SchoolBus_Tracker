import 'package:flutter/material.dart';

class DriverNotifications extends StatefulWidget {
  const DriverNotifications({Key? key}) : super(key: key);

  @override
  State<DriverNotifications> createState() => _DriverNotificationsState();
}

class _DriverNotificationsState extends State<DriverNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Notifications'),
      ),
    );
  }
}
