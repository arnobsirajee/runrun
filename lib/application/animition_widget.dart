import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runrun/application/user_data.dart';

import 'circle_widget.dart';

class animition_widget extends StatelessWidget {
  const animition_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Image.asset('assets/images/bubuwalk.gif'),
          SizedBox(height: 10,),

          // percentage widget & provider together
          Consumer<DataProvider>(
            builder: (context, userProvider, child) {
              final lastEntry = userProvider.lastData;

              // Handle empty list state
              if (lastEntry == null) {
                return const Text('');
              }
              final int stepsCount = int.tryParse(lastEntry.steps) ?? 0; //convert string to int
              final double hourCount = double.tryParse(lastEntry.hours) ?? 0;

              final double stepPercentage = (stepsCount / dailyStepsLimit); //percentage a convert korbe
              final double hourPercentage = (hourCount/ dailyHourlimit);
              final double CBPercentage = ((stepsCount*0.04)/CBlimit); //calory burn

              // return percentage widget
              return ConcentricProgressIndicator(
                outermostRadius: 60.0,
                lineWidth: 10.0,
                ringSpacing: 6.0,
                rings: [
                  RingData(percentage: (hourPercentage).clamp(0.0, 1.0), progressColor: Colors.lightBlueAccent), //daily time 1 hr
                  RingData(percentage: (stepPercentage).clamp(0.0, 1.0), progressColor: Colors.deepPurpleAccent), //daily steps set 6000
                  RingData(percentage: (CBPercentage).clamp(0.0, 1.0), progressColor: Colors.orangeAccent), //daily calories set 300
                ],
                child:

                const Icon(Icons.directions_run, size: 32, color: Colors.deepPurple,),


              );
            },
          ),

        ],
      ),
    );
  }
}