import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final void Function()? onTap;
  const MyListTile({Key? key, required this.icon, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text, style: const TextStyle(fontSize: 20),),
      onTap: onTap,
    );
  }
}
