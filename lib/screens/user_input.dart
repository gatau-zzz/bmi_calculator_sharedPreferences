import 'package:flutter/material.dart';
import 'bmi_result.dart';

class UserInput extends StatefulWidget {
  const UserInput({super.key});

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  bool _isMale = true;
  double _height = 170.0;
  double _weight = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text('BMI Calculator'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Gender selection in cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _isMale = true),
                    child: Card(
                      color: _isMale ? Colors.blue[100] : Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [Icon(Icons.male, size: 40), Text("Male")],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _isMale = false),
                    child: Card(
                      color: !_isMale ? Colors.pink[100] : Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Icon(Icons.female, size: 40),
                            Text("Female"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Height card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "Height",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "${_height.toStringAsFixed(1)} cm",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                      value: _height,
                      min: 100.0,
                      max: 250.0,
                      onChanged: (value) => setState(() => _height = value),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Weight card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "Weight",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "${_weight.toStringAsFixed(1)} kg",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                      value: _weight,
                      min: 30.0,
                      max: 150.0,
                      onChanged: (value) => setState(() => _weight = value),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),

            // Button at bottom
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BmiResult(
                      isMale: _isMale,
                      height: _height,
                      weight: _weight,
                    ),
                  ),
                ),
                child: const Text("CALCULATE", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
