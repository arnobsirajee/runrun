import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../application/circle_widget.dart';
import '../application/user_data.dart';

class walking extends StatefulWidget {
  const walking({super.key});

  @override
  State<walking> createState() => _walkingState();
}

class _walkingState extends State<walking> {

  final TextEditingController _stepsController = TextEditingController();
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcf6f0),

      appBar: AppBar(title: Text('WALKING TIME', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,letterSpacing: 2.0,),),),
      endDrawer: Drawer(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField to step input
            TextField(
              controller: _stepsController,
              decoration: const InputDecoration(
                labelText: 'Enter your Steps Number',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20,),
            // TextField to Hour input
            TextField(
              controller: _hourController,
              decoration: const InputDecoration(
                labelText: 'Enter Hours',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20,),
            // TextField to date input
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: 'Select Date',
                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null) {
                  String formattedDate =
                  "${pickedDate.toLocal()}".split(' ')[0];
                  setState(() {
                    _dateController.text = formattedDate;
                  });
                }
              },
            ),



            const SizedBox(height: 16),

            // Button to trigger the state change
            ElevatedButton(
              onPressed: () {
                final steps = _stepsController.text;
                final hours = _hourController.text;
                final date = _dateController.text;

                if (steps.isNotEmpty && hours.isNotEmpty && date.isNotEmpty) {
                  // Add new entry to the list in Provider
                  context.read<DataProvider>().addUser(steps, hours, date);


                  _stepsController.clear();
                  _hourController.clear();
                  _dateController.clear();

                }
              },
              child: const Text('Add Data'),
            ),

            const SizedBox(height: 20),

            const SizedBox(height: 20),

            //------------last data view

            Center(
              child: Consumer<DataProvider>(
                builder: (context, dataProvider, child) {
                  final lastEntry = dataProvider.lastData;

                  // Handle empty list state
                  if (lastEntry == null) {
                    return const Text('No entries found in the list.');
                  }

                  return Card(
                    margin: const EdgeInsets.all(16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.directions_run, size: 48, color: Colors.blue),
                          const SizedBox(height: 16),
                          Text(
                            'Steps: ${lastEntry.steps}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Hours: ${lastEntry.hours}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),

                          Text(
                            'Date: ${lastEntry.date}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
