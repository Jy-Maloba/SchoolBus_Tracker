import 'package:flutter/material.dart';

class StudentsAttendance extends StatefulWidget {
  const StudentsAttendance({Key? key}) : super(key: key);

  @override
  State<StudentsAttendance> createState() => _StudentsAttendanceState();
}

class _StudentsAttendanceState extends State<StudentsAttendance> {

  late Icon image;
  final String name = '';
  final String grade = '';
  late Icon attend;
  final String status='';

  bool onBoard = false;

  // Widget markAttendance(){
  //   if (onBoard){
  //     attend = const Icon(Icons.arrow_back);
  //     status = 'OffBoard';
  //     onBoard = true;
  //   }else{
  //     attend = const Icon(Icons.arrow_forward);
  //     status = 'OnBoard';
  //     onBoard = false;
  //   }
  //   return Container();
  // }

  Widget attendanceChecklist(image, name, grade, attend, status){

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.deepPurple[200],

      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Icon(image, size: 75, color: Colors.deepPurple,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('$name', style: const TextStyle(fontSize: 23, color: Colors.white),),
                  const SizedBox(height: 6,),
                  Text('$grade', style: const TextStyle(fontSize: 20, color: Colors.white),),

                  const SizedBox(height: 10,),

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.phone, color: Colors.white,),
                      const SizedBox(width: 25,),
                      GestureDetector(
                        onTap: (){
                          //call a function that changes the attendance status
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.deepPurple[400]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 17.0),
                            child: Row(
                              children: [
                                Icon(attend, color: Colors.white,),
                                TextButton(
                                  onPressed: (){
                                    //click to mark attendance
                                    if (onBoard == false){
                                      setState(() {
                                        status = 'OffBoard';
                                        onBoard = true;
                                      });
                                    }else{
                                      setState(() {
                                        status = 'OnBoard';
                                        onBoard = false;
                                      });
                                    }
                                  },
                                    child:
                                    Text(
                                      status,style: const TextStyle(fontSize: 20, color: Colors.white),
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Students Attendance'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.person, color: Colors.blue,),
                        Text('20', style: TextStyle(color: Colors.blue, fontSize: 18)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.done, color: Colors.green,),
                        Text('17', style: TextStyle(color: Colors.green, fontSize: 18)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.close, color: Colors.red,),
                        Text('3', style: TextStyle(color: Colors.red, fontSize: 18)),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 13,),

              //attendance list
              Column(
                children: [
                  attendanceChecklist(Icons.person_sharp, 'name', '3', Icons.directions_run, status),
                  const SizedBox(height: 13,),
                  attendanceChecklist(Icons.person_sharp, 'name', 'C1', Icons.directions_run, status),
                  const SizedBox(height: 13,),
                  attendanceChecklist(Icons.person_sharp, 'name', '3', Icons.directions_run, status),
                  const SizedBox(height: 13,),
                  attendanceChecklist(Icons.person_sharp, 'name', '3', Icons.directions_run, status),
                  const SizedBox(height: 13,),
                  attendanceChecklist(Icons.person_sharp, 'name', '3', Icons.arrow_forward, status),
                ],
              ),

            ],
          ),


        ),
      ),
    );
  }
}
