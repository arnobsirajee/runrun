import 'package:flutter/material.dart';

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

      appBar: AppBar(title: Text('DAILY GOAL', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,letterSpacing: 2.0,),),),
      endDrawer: Drawer(),

      body: Column(
        children: [
          //70% screen
          Expanded(
            flex: 70,
            child: Row(
            children: [

            ],
          ),
          ),

          //30% screen
          Expanded(child: Row(
            children: [

            ],
          ),
          ),


        ],
      ),
    );
  }
}
