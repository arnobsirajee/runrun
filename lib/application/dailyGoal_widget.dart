import 'package:flutter/material.dart';
import 'package:runrun/application/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dailyGoad_widget extends StatefulWidget {
  const dailyGoad_widget({
    super.key,
  });

  @override
  State<dailyGoad_widget> createState() => _dailyGoad_widgetState();
}

class _dailyGoad_widgetState extends State<dailyGoad_widget> {


  @override
  // STEP 1: This runs automatically every single time you reopen the app
  void initState() {
    super.initState();
    _loadSavedData();
  }

  // Load saved values on page open
  Future<void> _loadSavedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!mounted) return;

    setState(() {
      final String str1 = prefs.getString('saved_dailyStepsLimit') ?? '';
      final String str2 = prefs.getString('saved_dailyHourlimit') ?? '';
      final String str3 = prefs.getString('saved_CBlimit') ?? '';

      dailyStepsLimit = double.tryParse(str1) ?? 0.0;
      dailyHourlimit = double.tryParse(str2) ?? 0.0;
      CBlimit = double.tryParse(str3) ?? 0.0;
    });
  }
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text("DAILY GOAL"),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.circle,size: 10,color: Colors.orangeAccent,),
              Text(' Calories ',style: TextStyle(fontSize: 12,color: Colors.grey),),
              Text(CBlimit.toString(), style: TextStyle(fontSize: 12,color: Colors.grey),),
            ],
          ),


          Row(
            children: [
              Icon(Icons.circle,size: 10,color: Colors.deepPurple,),
              Text(' Steps ',style: TextStyle(fontSize: 12,color: Colors.grey),),
              Text('$dailyStepsLimit', style: TextStyle(fontSize: 12,color: Colors.grey),),
            ],
          ),

          Row(
            children: [
              Icon(Icons.circle,size: 10,color: Colors.blueAccent,),
              Text(' Hours ',style: TextStyle(fontSize: 12,color: Colors.grey),),
              Text( '$dailyHourlimit', style: TextStyle(fontSize: 12,color: Colors.grey),),
            ],
          ),

        ],
      ),
    );
  }
}