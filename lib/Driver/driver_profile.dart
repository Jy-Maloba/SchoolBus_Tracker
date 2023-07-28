import 'package:flutter/material.dart';
import 'package:schoolbus_app/Driver/driver_settings.dart';

import 'driver_info.dart';

class DriverProfile extends StatefulWidget {
  const DriverProfile({Key? key}) : super(key: key);

  @override
  State<DriverProfile> createState() => _DriverProfileState();
}

class _DriverProfileState extends State<DriverProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Profile'),
        // settings icon
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const DriverSettings(),),
                );
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 25.0),
              padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
              child: Column(
                children: [

                  // Profile details row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Parent Name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'James Maloba',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 8),

                          // parent
                          Text('Driver',
                            style: TextStyle(fontSize: 22, color: Colors.deepPurple[100]),
                          ),
                          const SizedBox(height: 8),

                          //phone details
                          Row(
                            children: [
                              const Icon(Icons.phone, color: Colors.white,),
                              const SizedBox(width: 8),
                              Text('+254792457216',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.deepPurple[100]),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          //mail details
                          Row(
                            children: [
                              const Icon(Icons.mail, color: Colors.white),
                              const SizedBox(width: 8),
                              Text('jamesmaloba94@gmail.com',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.deepPurple[100]),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // profile Icon
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: const Icon(
                          Icons.person, color: Colors.white, size: 70,
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12,),

            // Driver Info
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const Text('Driver Info', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                      ListTile(
                        iconColor: Colors.deepPurple,
                        leading: const Icon(Icons.person),
                        title: const Text('Personal Data',style: TextStyle(fontSize: 18, color: Colors.white),),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const DriverInfo()));
                        },
                      ),

                      ListTile(
                        iconColor: Colors.deepPurple,
                        leading: const Icon(Icons.settings),
                        title: const Text('Profile settings',style: TextStyle(fontSize: 18, color: Colors.white),),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const DriverSettings()));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 12,),

            // bus info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: BorderRadius.circular(12)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text('Bus Info', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.deepPurple),),

                      // Bus ID
                      ListTile(
                        iconColor: Colors.white,
                        leading: Text('Bus Number', style: TextStyle(fontSize: 18, color: Colors.deepPurple),),
                        title: Text('B05',style: TextStyle(fontSize: 18, color: Colors.white),),
                      ),

                      //Bus Capacity
                      ListTile(
                        iconColor: Colors.white,
                        leading: Text('Capacity', style: TextStyle(fontSize: 18, color: Colors.deepPurple),),
                        title: Text('40',style: TextStyle(fontSize: 18, color: Colors.white),),
                      ),

                      //Bus status
                      ListTile(
                        iconColor: Colors.white,
                        leading: Text('Status', style: TextStyle(fontSize: 18, color: Colors.deepPurple),),
                        title: Text('On Trip',style: TextStyle(fontSize: 18, color: Colors.white),),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],

          // children details

        ),
      ),
    );
  }
}
