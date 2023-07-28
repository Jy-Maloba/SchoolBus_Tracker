import 'package:flutter/material.dart';
import 'package:schoolbus_app/Driver/Driver_login.dart';

class DriverInfo extends StatefulWidget {
  const DriverInfo({Key? key}) : super(key: key);

  @override
  State<DriverInfo> createState() => _DriverInfoState();
}

class _DriverInfoState extends State<DriverInfo> {

  String name = 'John Doe';
  String phoneNumber = '123-456-7890';
  String gender = 'Male';
  String busID = 'B005';
  String email = 'johndoe@example.com';

  bool isMaleSelected = true;
  bool isFemaleSelected = false;

  void _showEditDialog(BuildContext context){
    String newName = name;
    String newPhoneNumber = phoneNumber;
    String newGender = gender;
    String newBus = busID;
    String newEmail = email;

    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Colors.deepPurple[200],
        title: const Text('Edit Driver Info', style: TextStyle(color: Colors.white),),
        content: Column(
          children: [
            //name
            TextField(
              onChanged: (value){
                newName = value;
              },
              // decoration: InputDecoration(labelText: 'Name',),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Name',
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),

            const SizedBox(height: 10,),

            //email
            TextField(
              onChanged: (value) {
                newEmail = value;
              },
              // decoration: InputDecoration(labelText: 'Email'),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Email',
                fillColor: Colors.grey[200],
                filled: true,
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 10,),

            //phone number
            TextField(
              onChanged: (value) {
                newPhoneNumber = value;
              },
              // decoration: InputDecoration(labelText: 'Phone Number'),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Phone',
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),

            const SizedBox(height: 10,),
            //BusId
            TextField(
              onChanged: (value) {
                newBus = value;
              },
              // decoration: InputDecoration(labelText: 'Children'),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'BusID',
                fillColor: Colors.grey[200],
                filled: true,
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 10,),

            Row(children: [
              Row(
                children: [
                  Checkbox(value: isMaleSelected, onChanged: (value){
                    setState(() {
                      isMaleSelected = value!;
                      isFemaleSelected = !value;
                      if (isMaleSelected){
                        newGender = 'Male';
                      }
                    });
                  }
                  ),
                  const Text('Male'),
                ],
              ),
              Row(
                children: [
                  Checkbox(value: isFemaleSelected, onChanged: (value){
                    setState(() {
                      isFemaleSelected = value!;
                      isMaleSelected = !value;
                      if (isFemaleSelected){
                        newGender = 'Female';
                      }
                    });
                  }
                  ),
                  const Text('Female'),
                ],
              )
            ],),

          ],
        ),
        actions: [
          TextButton(
              onPressed: (){
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: const Text('Cancel')),
          TextButton(
              onPressed: (){
                setState(() {
                  name = newName;
                  phoneNumber = newPhoneNumber;
                  gender = newGender;
                  busID = newBus;
                  email = newEmail;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Driver Info'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            _showEditDialog(context);
          },
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.edit)
      ),


      body: ListView(
        children: [
          const SizedBox(height: 50,),
          //profile picture
          const Icon(Icons.person, size: 85, color: Colors.deepPurple,),

          const SizedBox(height: 10,),
          //user names
          Text(
            name,
            style: const TextStyle(fontSize: 18, color: Colors.white),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 10,),

          const Padding(
            padding: EdgeInsets.only(left: 27.0),
            child: Text('My Details', style: TextStyle(fontSize: 20, color: Colors.white),),
          ),
          //email
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Container(
              // padding: EdgeInsets.only(left: 15, bottom: 15, top: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.deepPurple[200],
              ),
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(Icons.mail),
                    title: Text(email, style: const TextStyle(fontSize: 20, color: Colors.white)),
                    subtitle: const Text('Mail', style: TextStyle(fontSize: 18, color: Colors.white),),
                    iconColor: Colors.deepPurple,
                  ),

                  //phone number
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text(phoneNumber, style: const TextStyle(fontSize: 20, color: Colors.white)),
                    subtitle: const Text('Phone-Number', style: TextStyle(fontSize: 18, color: Colors.white),),
                    iconColor: Colors.deepPurple,
                  ),

                  //children
                  ListTile(
                    leading: const Icon(Icons.directions_transit_rounded),
                    title: Text(busID, style: const TextStyle(fontSize: 20, color: Colors.white)),
                    subtitle: const Text('BusID', style: TextStyle(fontSize: 18, color: Colors.white),),
                    iconColor: Colors.deepPurple,
                  ),

                  //gender
                  ListTile(
                    iconColor: Colors.deepPurple,
                    leading: const Icon(Icons.person),
                    title: Text(gender, style: const TextStyle(fontSize: 20, color: Colors.white)),
                    subtitle: const Text('Gender', style: TextStyle(fontSize: 18, color: Colors.white),),
                  )
                ],
              ),
            ),
          ),

          //log out
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple[200],
                  borderRadius: BorderRadius.circular(12)
              ),
              child: ListTile(
                iconColor: Colors.deepPurple,
                leading: const Icon(Icons.logout),
                title: const Text('Logout', style: TextStyle(fontSize: 18, color: Colors.white),),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const DriverLogin()));
                },
              ),
            ),
          )


        ],
      ),
    );
  }
}
