import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schoolbus_app/Screen/select_user.dart';
import 'package:schoolbus_app/Screen/studentInfoUpdate.dart';
import 'package:schoolbus_app/components/list_tile.dart';
import 'package:schoolbus_app/maps/parent_map.dart';
import 'package:schoolbus_app/parentPage/ParentProfile.dart';
import 'package:schoolbus_app/parentPage/p_messages.dart';
import 'package:schoolbus_app/parentPage/p_notifications.dart';
import 'package:schoolbus_app/parentPage/p_settings.dart';

// import 'parent_login.dart';

class ParentHomePage extends StatefulWidget {
  const ParentHomePage({Key? key}) : super(key: key);

  @override
  State<ParentHomePage> createState() => _ParentHomePageState();
}

class _ParentHomePageState extends State<ParentHomePage> {
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
                MaterialPageRoute(builder: (context)=> const ParentNotifications())
            );
          },
            icon: const Icon(Icons.notifications, color: Colors.white,),
          ),

          IconButton(
            onPressed: (){
              print('sent to user selection');
              FirebaseAuth.instance.signOut();
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SelectUser()));
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
                                MaterialPageRoute(builder: (context)=> const ParentProfile())
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
                    MaterialPageRoute(builder: (context)=> const ParentHomePage())
                );
              }),

              MyListTile(icon: Icons.notifications, text: 'Notifications', onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> const ParentNotifications())
                );
              }),

              MyListTile(icon: Icons.person, text: 'profile', onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> const ParentProfile())
                );
              }),

              MyListTile(icon: Icons.message, text: 'Messages', onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> const ParentMessages())
                );
              }),

              MyListTile(icon: Icons.settings, text: 'Settings', onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> const ParentSettings())
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
                          'Hi User',
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
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: const Icon(
                          Icons.person, color: Colors.white,
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
                      // Heading
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('data',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
                          Icon(Icons.more_horiz),
                        ],
                      ),

                      const SizedBox(height: 20,),

                      //Listview of info
                      Expanded(
                          child: ListView(
                            children: [
                              const StudentLocationInfo(icon: Icons.person, locationStatus: 'At Home', name: 'James M', colour: Colors.deepPurple),
                              const StudentLocationInfo(icon: Icons.person, locationStatus: 'At School', name: 'Jaime M', colour: Colors.deepPurple),

                              const SizedBox(height: 20,),

                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  tileColor: Colors.white,
                                  leading: const Icon(Icons.my_location, color: Colors.white,),
                                  title: const Text('Set your location and the destination', style: TextStyle(color: Colors.white, fontSize: 16),),
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ParentMapsPage()));
                                  },

                                ),
                              ),
                            ],
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



