import 'package:flutter/material.dart';

class StudentLocationInfo extends StatelessWidget {

  final icon;
  final String name;
  final String locationStatus;
  final colour;

  const StudentLocationInfo(
      {Key? key, required this.icon, required this.locationStatus, required this.name, required this.colour}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: colour,
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                    Text(locationStatus, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey,),),
                  ],
                ),
              ],),

            //far right icon
            const Icon(Icons.directions),
          ],
        ),

      ),
    );
  }
}
