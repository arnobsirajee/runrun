import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../application/user_data.dart';


class SetLimit extends StatefulWidget {
  const SetLimit({super.key});

  @override
  State<SetLimit> createState() => _SetLimitState();
}

class _SetLimitState extends State<SetLimit> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _num3Controller = TextEditingController();


  double dynamicSum = 0;


  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    _num3Controller.dispose();
    super.dispose();
  }

  // STEP 1: This runs automatically every single time you reopen the app
  void initState() {
    super.initState();
    _loadSavedData();
  }
  // STEP 2: Pulls the data out of storage on app startup
  Future<void> _loadSavedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // 1. Restore the text inside the input fields
      _num1Controller.text = prefs.getString('saved_dailyStepsLimit') ?? '';  // new var saved_num1
      _num2Controller.text = prefs.getString('saved_dailyHourlimit') ?? '';  // new var saved_num2
      _num3Controller.text = prefs.getString('saved_CBlimit') ?? '';  // new var saved_num2
      // 2. Sync them back into your global variables
      dailyStepsLimit = double.tryParse(_num1Controller.text) ?? 0.0;
      dailyHourlimit = double.tryParse(_num2Controller.text) ?? 0.0;
      CBlimit = double.tryParse(_num3Controller.text) ?? 0.0;

    });
  }
  // STEP 3: Writes the text inputs safely onto the device memory
  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_dailyStepsLimit', _num1Controller.text);
    await prefs.setString('saved_dailyHourlimit', _num2Controller.text);
    await prefs.setString('saved_CBlimit', _num3Controller.text);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('WALKING TIME', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,letterSpacing: 2.0,),),),
      endDrawer: Drawer(),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(height: 8),
              TextField(
                controller: _num1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Daily Step Goal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 8),
              TextField(
                controller: _num2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Daily Time Goal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const SizedBox(height: 8),
              TextField(
                controller: _num3Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Calory Burn Goal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    dailyStepsLimit = double.tryParse(_num1Controller.text) ?? 0.0;
                    dailyHourlimit = double.tryParse(_num2Controller.text) ?? 0.0;
                    CBlimit = double.tryParse(_num2Controller.text) ?? 0.0;
                  });
                  _saveData(); // Saves to disk immediately when clicked
                },
                child: const Text('SET LIMIT'),
              ),
              const SizedBox(height: 24),
              Text(
                'Steps Limit: $dailyStepsLimit, Hour Limit: $dailyHourlimit, cb limit: $CBlimit ',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
