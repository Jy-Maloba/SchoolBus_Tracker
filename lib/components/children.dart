import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Children extends StatefulWidget {


  const Children({Key? key,}) : super(key: key);

  @override
  State<Children> createState() => _ChildrenState();
}

class _ChildrenState extends State<Children> {

  List<Item> items = [];

  final _studentName = TextEditingController();
  final _parentName = TextEditingController();
  final _grade = TextEditingController();
  var _busID = TextEditingController();

  @override
  void dispose() {
    _studentName.dispose();
    _parentName.dispose();
    _grade.dispose();
    _busID.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _listenToChildrenUpdates();
  }

  // Listen for changes in the Firestore collection
  void _listenToChildrenUpdates(){
    FirebaseFirestore.instance.collection('children').snapshots().listen((snapshot) {
      List<Item> loadedItems = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return Item(
          id: doc.id, //store the document id
          studentName: data['student name'],
          parentName: data['parent name'],
          grade: data['grade'],
          busID: data['Bus ID'],
        );
      }).toList();
      setState(() {
        items = loadedItems;
      });
    });
  }

  Future addchildDetails(String studentName, String parentName, String grade, String busID) async{
    await FirebaseFirestore.instance.collection('children').add(
        {
          'student name': studentName,
          'parent name': parentName,
          'grade': grade,
          'Bus ID': busID,
        }
    );
  }

  void _showAddItemDialog(BuildContext context){
    String id = '';
    String studentName = '';
    String ParentName = '';
    String grade = '';
    String busID = '';

    // Reset the controllers to an empty string
    _studentName.text = '';
    _parentName.text = '';
    _grade.text = '';
    _busID.text = '';


    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        elevation: 50,
        title: const Text('Add Student'),
        content: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.min,
            children: [
              TextField(
                controller: _studentName,
                onChanged: (value){
                  studentName = value;
                },
                decoration: const InputDecoration(labelText: 'Student Name'),
              ),
              TextField(
                controller: _parentName,
                onChanged: (value){
                  ParentName = value;
                },
                decoration: const InputDecoration(labelText: 'Parent Name'),
              ),
              TextField(
                controller: _grade,
                onChanged: (value){
                  grade = value;
                },
                decoration: const InputDecoration(labelText: 'Grade'),
              ),
              TextField(
                controller: _busID,
                onChanged: (value){
                  busID = value;
                },
                decoration: const InputDecoration(labelText: 'Bus ID'),
              ),
            ],
          ),
        ),

        actions: [
          TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),),

          //add child info
          TextButton(
            onPressed: (){
              setState(() {
                items.add(Item(studentName: studentName, parentName: ParentName, grade: grade, busID: busID, id: id));
                addchildDetails(
                    _studentName.text.trim(),
                    _parentName.text.trim(),
                    _grade.text.trim(),
                    _busID.text.trim()
                );
                Navigator.of(context).pop();
              });
            },
            child: const Text('Add'),),
        ],
      );
    });
  }

  //function to remove student from the list
  void _showDeleteDialog (BuildContext context, int index){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: const Text('Delete'),
        content: const Text('Are you sure you want to delete?'),
        actions: [
          // cancel process
          TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text('Cancel')
          ),

          //delete student
          TextButton(
              onPressed: ()async{
                Navigator.of(context).pop(); //close the dialog box
                String documentID = items[index].id;
                await FirebaseFirestore.instance.collection('children').doc(documentID).delete();
                if (mounted){
                  setState(() {
                    items.removeAt(index);
                  });
                }
              },
              child: const Text('Delete'),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Children', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //add a child in the list
          _showAddItemDialog(context);
        },
         backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  leading: const CircleAvatar(radius: 28, backgroundColor: Colors.deepPurple,),
                  title: Text(items[index].studentName, style: const TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          const Text('Grade'),
                          const SizedBox(width: 10,),
                          Text(items[index].grade),
                        ],
                      ),
                      const SizedBox(width: 10,),
                      Row(
                        children: [
                          const Text('Bus ID'),
                          const SizedBox(width: 10,),
                          Text(items[index].busID),
                        ],
                      ),
                    ],
                  ),
                  subtitleTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700]),
                  trailing: IconButton(
                      onPressed: (){
                        _showDeleteDialog(context, index);
                      },
                      icon: const Icon(Icons.delete,)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Item {
  final String id;
  final String studentName;
  final String parentName;
  final String grade;
  final String busID;

  Item({required this.id ,required this.studentName, required this.parentName, required this.grade, required this.busID});
}
