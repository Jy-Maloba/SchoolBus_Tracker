import 'package:flutter/material.dart';
import 'package:schoolbus_app/components/children.dart';
import 'package:schoolbus_app/parentPage/p_settings.dart';
import 'package:schoolbus_app/parentPage/parents_info.dart';

class ParentProfile extends StatefulWidget {
  const ParentProfile({Key? key}) : super(key: key);

  @override
  State<ParentProfile> createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[600],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Profile'),
        // settings icon
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const ParentSettings(),),
                );
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: SafeArea(
        child: ListView(
        children: [
          Container(
            child: Padding(
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
                            'John Doe',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 8),

                          // parent
                          Text('Father',
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
                              Text('johndoe94@gmail.com',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.deepPurple[100]),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // profile Icon
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[400],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: TextButton(
                          onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=> const ParentProfile())
                            );
                          },
                          child: const Icon(
                            Icons.person, color: Colors.white, size: 70,
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12,),

          // Parent Info
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
                    const Text('User Info', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                    ListTile(
                      iconColor: Colors.deepPurple,
                      leading: const Icon(Icons.person),
                      title: const Text('Personal Data',style: TextStyle(fontSize: 18, color: Colors.deepPurple),),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ParentInfo()));
                      },
                    ),

                    ListTile(
                      iconColor: Colors.deepPurple,
                      leading: const Icon(Icons.settings),
                      title: const Text('Profile settings',style: TextStyle(fontSize: 18, color: Colors.deepPurple),),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ParentSettings()));
                      },
                    ),

                    ListTile(
                      iconColor: Colors.deepPurple,
                      leading: const Icon(Icons.child_care_sharp),
                      title: const Text('Children',style: TextStyle(fontSize: 18, color: Colors.deepPurple),),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Children()));
                      },
                    )

                  ],
                ),
              ),
            ),
          ),

          // SizedBox(height: 12,),

          //children
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.deepPurple[200],
          //   ),
          //   child: const Padding(
          //     padding: EdgeInsets.all(25.0),
          //     child: Column(
          //       children: [
          //         StudentLocationInfo(icon: Icons.person, locationStatus: 'At home', name: 'Lorem Ipsum', colour: Colors.deepPurple),
          //         StudentLocationInfo(icon: Icons.person, locationStatus: 'At home', name: 'Lorem Ipsum', colour: Colors.deepPurple),
          //         StudentLocationInfo(icon: Icons.person, locationStatus: 'At home', name: 'Lorem Ipsum', colour: Colors.deepPurple),
          //         StudentLocationInfo(icon: Icons.person, locationStatus: 'At home', name: 'Lorem Ipsum', colour: Colors.deepPurple),
          //     ],),
          //   ),
          // )
        ],

          // children details

      ),
      ),
    );
  }
}
