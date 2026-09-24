import 'package:flutter/material.dart';
import 'package:runrun/application/user_data.dart';

class dailyGoad_widget extends StatelessWidget {
  const dailyGoad_widget({
    super.key,
  });

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
              Text(dailyStepsLimit.toString(), style: TextStyle(fontSize: 12,color: Colors.grey),),
            ],
          ),

          Row(
            children: [
              Icon(Icons.circle,size: 10,color: Colors.blueAccent,),
              Text(' Hours ',style: TextStyle(fontSize: 12,color: Colors.grey),),
              Text(dailyHourlimit.toString(), style: TextStyle(fontSize: 12,color: Colors.grey),),
            ],
          ),

        ],
      ),
    );
  }
}