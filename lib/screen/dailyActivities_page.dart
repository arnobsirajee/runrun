import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dailyActivities extends StatefulWidget {
  const dailyActivities({super.key});

  @override
  State<dailyActivities> createState() => _dailyActivitiesState();
}

class _dailyActivitiesState extends State<dailyActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcf6f0),
      appBar: AppBar(title: Text('DAILY ACTIVITIES', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,letterSpacing: 2.0,),),),
      endDrawer: Drawer(),

      body: Text("Daily activities list "),
    );
  }
}
