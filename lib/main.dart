import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schoolbus_app/Screen/select_user.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splashstate(),
  ));
}

class Splashstate extends StatefulWidget {
  const Splashstate({Key? key}) : super(key: key);

  @override
  State<Splashstate> createState() => _SplashstateState();
}

class _SplashstateState extends State<Splashstate>
    with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SelectUser()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.white],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight
            )
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('School Bus App', style: TextStyle(fontSize: 30, color: Colors.deepPurple),)
          ],
        ),
      ),
    );
  }
}
