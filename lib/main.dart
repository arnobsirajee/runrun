import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runrun/application/apps.dart';
import 'package:runrun/application/user_data.dart';


void main() {

  runApp(

    //ChangeNotifierProvider data management er jonno use kore, global variable

    ChangeNotifierProvider(create: ((context) => DataProvider()..loadFromPrefs()),

      child: const RunRun(),

    ),

  );

}

