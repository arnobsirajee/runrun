import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../application/user_data.dart';

class dailyActivities extends StatefulWidget {
  const dailyActivities({super.key});

  @override
  State<dailyActivities> createState() => _dailyActivitiesState();
}

class _dailyActivitiesState extends State<dailyActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcf6f0),
      appBar: AppBar(title: Text('DAILY ACTIVITIES', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,letterSpacing: 2.0,),),),
      endDrawer: Drawer(),

      body: Consumer<DataProvider>(
        builder: (context, userProvider, child) {
          final users = userProvider.userList;

          if (users.isEmpty) {
            return const Center(child: Text('No users added yet.'));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return ListTile(
                leading: const Icon(Icons.history),
                title: Row(
                  children: [
                    Icon(Icons.directions_run,size: 14,),
                    SizedBox(width: 10,),
                    Text(user.steps,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),)
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timer,size: 12,),
                        SizedBox(width: 10,),
                        Text(user.hours,style: TextStyle(fontSize: 12),),
                        Text(" hour",style:TextStyle(fontSize: 12),),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.date_range,size: 14,),
                        SizedBox(width: 10,),
                        Text(user.date,style: TextStyle(fontSize: 12),),
                      ],
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Remove item on button tap
                    context.read<DataProvider>().removeUser(index);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
