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
      body: Text("Walking data entry"),
    );
  }
}
