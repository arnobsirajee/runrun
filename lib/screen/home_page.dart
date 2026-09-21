import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application/circle_widget.dart';
import '../application/user_data.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcf6f0),

      appBar: AppBar(title: Text('Hi! USER', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,letterSpacing: 2.0,),),),
      endDrawer: Drawer(),

      body:  Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xfffcf6f0),
        child: Column(
            children:[

              //70% screen
              Expanded(
                  flex: 70,
                  child: Container(
                    height: 100, width: double.infinity,color: Color(0xfffcf6f0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),

                      // devide one coloumn into two part
                      child: Row(
                        children: [

                          //resutl screen
                          Expanded(
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.start,
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [

                                // % display
                                Row(
                                  children: [

                                    Consumer<DataProvider>(
                                      builder: (context, userProvider, child) {
                                        final lastEntry = userProvider.lastData;

                                        // Handle empty list
                                        if (lastEntry == null) {
                                          return const Text('0',style: TextStyle(fontSize: 60,fontWeight: FontWeight.w700,color: Color(0xff34446f)),);
                                        }
                                        final int stepsCount = int.tryParse(lastEntry.steps) ?? 0; //convert string to int
                                        final double stepPercentage = (stepsCount / 6000) * 100; //percentage a convert korbe

                                        return Text(
                                          '${stepPercentage.ceil()}',  //ceiling function
                                          style: TextStyle(fontSize: 60,fontWeight: FontWeight.w700,color: Color(0xff34446f)),
                                        );
                                      },
                                    ),
                                    Text("%",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Color(0xff34446f) ),),

                                  ],
                                ),
                                //calories----ddwd
                                Row(
                                  children: [
                                    Icon(Icons.local_fire_department,size: 30,color: Colors.orangeAccent,),

                                    Consumer<DataProvider>(
                                      builder: (context, userProvider, child) {
                                        final lastEntry = userProvider.lastData;

                                        // Handle empty list
                                        if (lastEntry == null) {
                                          return const Text('0',
                                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Color(0xff34446f)),);
                                        }
                                        final int stepsCount = int.tryParse(lastEntry.steps) ?? 0; //convert string to int
                                        final double caloryBurn = (stepsCount*0.04 ); //0.04 calory burn in 1 step

                                        return Text(
                                          '${caloryBurn.ceil()}',  //ceiling function
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xff34446f)),
                                        );
                                      },
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    SizedBox(width:30,),
                                    Text("Calories",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey.shade500),),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                //steps--------dwdd
                                Row(
                                  children: [
                                    Icon(Icons.directions_walk_outlined,size: 30,color: Colors.deepPurpleAccent,),
                                    Consumer<DataProvider>(
                                      builder: (context, userProvider, child) {
                                        final lastEntry = userProvider.lastData;

                                        // Handle empty list
                                        if (lastEntry == null) {
                                          return const Text('0',
                                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Color(0xff34446f)),);
                                        }
                                        final int stepsCount = int.tryParse(lastEntry.steps) ?? 0; //convert string to int
                                        return Text(
                                          '$stepsCount',
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xff34446f)),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width:30,),
                                    Text("Steps",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey.shade500),),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                //time--------dwdd
                                Row(
                                  children: [
                                    Icon(Icons.timer,size: 30,color: Colors.lightBlueAccent,),
                                    Consumer<DataProvider>(
                                      builder: (context, userProvider, child) {
                                        final lastEntry = userProvider.lastData;

                                        // Handle empty list
                                        if (lastEntry == null) {
                                          return const Text('0',
                                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Color(0xff34446f)),);
                                        }
                                        final int stepsCount = int.tryParse(lastEntry.hours) ?? 0; //convert string to int
                                        return Text(
                                          '$stepsCount',
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xff34446f)),
                                        );
                                      },
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    SizedBox(width:30,),
                                    Text("hours",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey.shade500),),
                                  ],
                                ),

                              ],
                            ),
                          ),


                          //animation screen
                          Expanded(
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
                                    final int hourCount = int.tryParse(lastEntry.hours) ?? 0;

                                    final double stepPercentage = (stepsCount / dailyLimit); //percentage a convert korbe
                                    final double hourPercentage = (hourCount/ dailyHourlimit);
                                    final double CBPercentage = ((stepsCount*0.04)/CBlimit);

                                    // percentage widget
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
                          )
                        ],
                      ),
                    ),
                  )
              ),


              //30% screen--------***
              Expanded(
                  flex: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        height: 100, width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffecdccf),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.map,size: 40,),
                              Text("Walking is the best possible exercise.")
                            ],
                          ),
                        )
                    ),
                  )
              )


            ]
        ),
      ),
    );
  }
}
