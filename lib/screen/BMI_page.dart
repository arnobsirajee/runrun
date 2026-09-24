import 'package:flutter/material.dart';


import '../application/user_data.dart';

class bmi_check extends StatefulWidget {
  const bmi_check({super.key});

  @override
  State<bmi_check> createState() => _bmi_checkState();
}

class _bmi_checkState extends State<bmi_check> {

  TextEditingController _ageController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  double bmiCheck =0;

  void _calculateBMI() {
    // double.tryParse converts the text to a number safely.
    // If input is empty or invalid, it defaults to 0.0 using '??'.
    final double weight = double.tryParse(_weightController.text) ?? 0.0;
    final double height = double.tryParse(_heightController.text) ?? 0.0;
    double heightM = height*0.3048; //height convert to meter

    setState(() {
      bmiCheck = weight / (heightM*heightM);
    });
  }

  String? _selectedGender ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcf6f0),
      appBar: AppBar(title: Text('BMI CALCULETOR', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,letterSpacing: 2.0,),),),
      endDrawer: Drawer(),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Form(
              key: _formKey, // Assign the key to the Form wrapper
              child: Column(
                children: [

                  //1st row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RadioMenuButton<String>(
                        value: 'Male',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() => _selectedGender = value);
                        },
                        trailingIcon: const Icon(Icons.male,color: Colors.blue,), // Your icon here
                        child: const Text('MALE'),
                      ),
                      RadioMenuButton<String>(
                        value: 'Female',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() => _selectedGender = value);
                        },
                        trailingIcon: const Icon(Icons.female,color: Colors.pinkAccent,), // Your icon here
                        child: const Text('FEMALE',),
                      ),
                    ],
                  ),

                  //2nd row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligns fields with error messages
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _ageController,
                          decoration: InputDecoration(
                            labelText: 'Age',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          // Validation logic
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) return 'Required';
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _weightController,
                          decoration: InputDecoration(
                            labelText: 'Weight (KG)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          // Validation logic
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) return 'Required';
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _heightController,
                          decoration: InputDecoration(
                            labelText: 'Height (m)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          // Validation logic
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) return 'Required';
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {

                      // 1. Check if gender is selected
                      if (_selectedGender == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a gender (Male or Female)'),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                        return; // Stop execution
                      }

                      // Check if ALL text fields have text inside them
                      if (_formKey.currentState!.validate()) {
                        // ONLY executes if every field passes the validator check
                        _calculateBMI();

                        _ageController.clear();
                        _weightController.clear();
                        _heightController.clear();
                        _selectedGender = null; //reset radio button after submit value
                        FocusScope.of(context).unfocus();
                      }
                    },
                    child: const Text('Check'),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10,),

            SizedBox(height: 20,),

            Text("YOUR BMI", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),

            Text(
              'Selected: ${_selectedGender ?? "None selected"}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            
            Text('BMI: ${bmiCheck.toStringAsFixed(2)}',)



          ],
        ),
      ),
    );
  }
}
