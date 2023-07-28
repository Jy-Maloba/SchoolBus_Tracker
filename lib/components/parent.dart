import 'package:flutter/cupertino.dart';

class Parent{
  final String name;
  final String email;
  final int age;
  final int numberofChildren;
  final List children;

  Widget addChild(){
    return Container();
  }

  void updateLocation(){
    //update location
  }

  Parent(this.name, this.email, this.age, this.numberofChildren, this.children);
}