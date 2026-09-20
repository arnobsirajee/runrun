import 'package:flutter/material.dart';
import '../screen/landingpage.dart';

class RunRun extends StatefulWidget {
  const RunRun({super.key});

  @override
  State<RunRun> createState() => _RunRunState();
}

class _RunRunState extends State<RunRun> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xfffcf6f0),
        )
      ),
      debugShowCheckedModeBanner: false,
      title: ("RUNRUN"),

      home: landingPage(),

    );
  }
}
