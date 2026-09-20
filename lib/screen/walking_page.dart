import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class walking extends StatefulWidget {
  const walking({super.key});

  @override
  State<walking> createState() => _walkingState();
}

class _walkingState extends State<walking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcf6f0),

      appBar: AppBar(title: Text('WALKING TIME', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,letterSpacing: 2.0,),),),
      endDrawer: Drawer(),

      body: Text("Walking data entry"),
    );
  }
}
