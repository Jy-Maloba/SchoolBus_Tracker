import 'package:flutter/material.dart';
import 'package:schoolbus_app/Driver/Driver_login.dart';
import 'package:schoolbus_app/Screen/signUp.dart';
import 'package:schoolbus_app/parentPage/parent_login.dart';

class SelectUser extends StatelessWidget {
  const SelectUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[300],
                borderRadius: BorderRadius.circular(12),

              ),
              child: TextButton(
                  onPressed: (){
                    //navigate to parent log in page
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ParentLogin()));
                  },
                  child: const Text(
                    'Log in as a Parent',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
              ),
            ),

            const SizedBox(height: 10,),

            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[300],
                borderRadius: BorderRadius.circular(12),

              ),
              child: TextButton(

                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const DriverLogin()));
                    //navigate to drover log in page
                  },
                  child: const Text(
                    'Log in as a Driver',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                    ),
                  )
              ),
            ),
            const SizedBox(height: 25,),

            //register button (not a member? register now)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpFormPage()));
                  },
                  child: const Text('  Register Now!',
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
