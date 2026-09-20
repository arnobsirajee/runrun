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
      body: Text("Daily activities list "),
    );
  }
}
