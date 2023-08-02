import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'driver_chat.dart';

class DriverMessages extends StatefulWidget {
  const DriverMessages({Key? key}) : super(key: key);

  @override
  State<DriverMessages> createState() => _DriverMessagesState();
}

class _DriverMessagesState extends State<DriverMessages> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: Colors.deepPurple,
      ),
      body: _buildUserList(),
    );
  }

  //build a list of users except for the current logged in user
  Widget _buildUserList(){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('parent').snapshots(),
      builder: (context, snapshot){
      if (snapshot.hasError){
        return const Text('Error');
      }
      if (snapshot.connectionState == ConnectionState.waiting){
        return const Center(child: Text('loading...'));
      }
      return ListView(
        children: snapshot.data!.docs
            .map<Widget>((doc) => _buildUserListItem(doc))
            .toList(),
      );
      },
    );
  }

  //build individual user list items

  Widget _buildUserListItem(DocumentSnapshot document){
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    //display all users except current user
    if (_auth.currentUser!.email != data['email']){
      return ListTile(
        title: Text(data['email']),
        onTap: (){
          //pass the clicked user's UID to the chat page
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DriverChatPage(receiverUserEmail: data['email'], receiverUID: data['first name'],))
          );
        },
      );
    } else{
      return Container();
    }
  }

}
