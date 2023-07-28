import 'package:flutter/material.dart';
import 'package:schoolbus_app/Driver/Driver_login.dart';
import 'package:schoolbus_app/Driver/bus_info.dart';
import 'package:schoolbus_app/Driver/route.dart';
import '../Driver/driver_messages.dart';
import '../Driver/driver_notifications.dart';
import '../Driver/driver_profile.dart';
import '../Driver/driver_settings.dart';
import '../Driver/students_attendance.dart';
import '../components/list_tile.dart';
import '../maps/driver_map.dart';


class DriverHomePage extends StatefulWidget {
  const DriverHomePage({Key? key}) : super(key: key);

  @override
  State<DriverHomePage> createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[600],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,

        //Log out Icon
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> const DriverNotifications())
            );
          },
            icon: const Icon(Icons.notifications, color: Colors.white,),
          ),

          IconButton(
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const DriverLogin())
              );
            },
            icon: const Icon(Icons.logout, color: Colors.white,),
          ),


        ],
      ),
      drawer: Drawer( child:
      Container(
        color: Colors.deepPurple[100],
        child: ListView(
          padding: const EdgeInsets.only(left: 20),
          children: [
            DrawerHeader(child:
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right:100.0),
                child: Column(
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=> const DriverProfile())
                          );
                        },
                        icon: const Icon(Icons.person, size: 100,)),
                  ],
                ),
              ),
            )
            ),


            //Home list tile
            MyListTile(icon: Icons.home, text: 'Home', onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const DriverHomePage())
              );
            }),

            MyListTile(icon: Icons.notifications, text: 'Notifications', onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const DriverNotifications())
              );
            }),

            MyListTile(icon: Icons.person, text: 'profile', onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const DriverProfile())
              );
            }),

            MyListTile(icon: Icons.message, text: 'Messages', onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const DriverMessages())
              );
            }),

            MyListTile(icon: Icons.settings, text: 'Settings', onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const DriverSettings())
              );
            }),

          ],
        ),
      ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 25.0),
              padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
              child: Column(
                children: [
                  // greetings and notifications row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Hi James
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hi Driver',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 8),
                          Text('19 Jun 2023',
                            style: TextStyle(color: Colors.deepPurple[200]),
                          ),
                        ],
                      ),

                      // Profile Icon
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[400],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                        child: IconButton(
                          padding: const EdgeInsets.all(12),
                          color: Colors.deepPurple,
                          onPressed: (){
                            //navigate to driver profile
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=> const DriverProfile())
                            );
                          },
                          icon: const Icon(Icons.person, color: Colors.white,),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25,),

            //info space
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(25),
                color: Colors.deepPurple[200],
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //add location
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[400],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                              onPressed: (){
                                //add location
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=> const DriverMap())
                                );
                              },
                              child: const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'add',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.my_location, color: Colors.white,)
                                ],
                              ),
                            ),
                          ),
                          //share location
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[400],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                                onPressed: (){
                                  //share location
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>DriverRoute())
                                  );
                                },
                                child: const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Share',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.share_location, color: Colors.white,)
                                  ],
                                ),
                            ),
                          ),
                          //stop sharing location
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[400],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                              onPressed: (){
                                //stop sharing location
                              },
                              child: const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Stop',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.wrong_location_sharp, color: Colors.white,)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10,),
                      // Trips and SOS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Trips',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.deepPurple[900]),),
                          //SOS
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: IconButton(
                                    onPressed: (){
                                      //sermon emergency services
                                    },
                                    icon: const Icon(Icons.sos, color: Colors.white, size: 25,)),
                              )
                          ),
                        ],
                      ),

                      const SizedBox(height: 10,),

                      //Current trip info
                      Expanded(
                        child: ListView(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.deepPurple[400],
                              ),
                              //trip info
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      title: const Text('Current Trip', style: TextStyle(fontSize: 20, color: Colors.white),),
                                      trailing: const Icon(Icons.directions, color: Colors.white,),
                                      onTap: (){
                                        //navigate to driver maps for directions
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context)=>const DriverMap()
                                        ),
                                        );
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.directions_bus_rounded, color: Colors.white,),
                                      title: const Text('Bus 001', style: TextStyle(fontSize: 20, color: Colors.white)),
                                      onTap: (){
                                        //bus information
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context)=>const BusInfo()
                                            )
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Row(
                                            children: [
                                              Icon(Icons.school_sharp, color: Colors.white,),
                                              SizedBox(width: 5,),
                                              Text('20',style: TextStyle(color: Colors.white, fontSize: 15) ),
                                            ],
                                          ),
                                          const Row(
                                            children: [
                                              Icon(Icons.done, color: Colors.white,),
                                              Text('17', style: TextStyle(color: Colors.white, fontSize: 15)),
                                            ],
                                          ),
                                          const Row(
                                            children: [
                                              Icon(Icons.close, color: Colors.white,),
                                              Text('3', style: TextStyle(color: Colors.white, fontSize: 15)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                  onPressed: (){
                                                    //list of students page
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) => StudentsAttendance()));
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.deepPurple,
                                                      borderRadius: BorderRadius.circular(12)
                                                    ),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(8.0),
                                                      child: Text(
                                                        'View Students',
                                                        style: TextStyle(
                                                            color: Colors.white, fontSize: 15,
                                                        ),

                                                      ),
                                                    ),
                                                  )
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10,),


                      //Upcoming and Visited trips selection
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.deepPurple[400],
                              borderRadius: BorderRadius.circular(12)
                          ),
                          // width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: TextButton(
                                      onPressed: (){
                                        //navigate to upcoming trips
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(1.0),
                                        child: Text(
                                          'Upcoming Trips',
                                          style: TextStyle(color: Colors.white, fontSize: 15,),
                                        ),
                                      ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[200],
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      //navigate to upcoming trips
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child: Text(
                                        'Completed Trips',
                                        style: TextStyle(color: Colors.white, fontSize: 15,),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
