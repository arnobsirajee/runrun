import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application/user_data.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcf6f0),
      appBar: AppBar(title: Text('HI! USER', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,letterSpacing: 2.0,),),),
      endDrawer: Drawer(),

      body: Column(
        children: [
          // call data provider here from other page
          Consumer<DataProvider>(
            builder: (context, userProvider, child) {
              final lastEntry = userProvider.lastData;

              // Handle empty list state
              if (lastEntry == null) {
                return const Text('No entries found.');
              }
              final int stepsCount = int.tryParse(lastEntry.steps) ?? 0;

              return Text(
                'Steps: ${((stepsCount/6000)*100).ceil()}%',
                style: Theme.of(context).textTheme.titleLarge,
              );
            },
          ),
        ],
      )
    );
  }
}
