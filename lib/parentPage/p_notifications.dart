import 'package:flutter/material.dart';

class ParentNotifications extends StatefulWidget {
  const ParentNotifications({Key? key}) : super(key: key);

  @override
  State<ParentNotifications> createState() => _ParentNotificationsState();
}

class _ParentNotificationsState extends State<ParentNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.deepPurple[300],
      ),
    );
  }
}
