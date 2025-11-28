// ui/screens/temperature_screen.dart
import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  // 1. Variable to store the converted value
  String conversionResult = '';

  // 2. Define the decoration here (inside the State)
  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  // 3. The function to handle the calculation
  void calculateTemperature(String value) {
    setState(() {
      if (value.isEmpty) {
        conversionResult = ''; // Clear if input is empty
        return;
      }

      // Try to parse the input to a double
      double? tempCelsius = double.tryParse(value);

      if (tempCelsius != null) {
        // Formula: F = C * 1.8 + 32
        double tempFahrenheit = (tempCelsius * 1.8) + 32;
        // Keep only 2 decimals for a cleaner display
        conversionResult = tempFahrenheit.toStringAsFixed(2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Temperature in Degrees:",
                style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10),

            // 4. Input Field with onChanged
            TextField(
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number, // Show number keyboard
              onChanged: calculateTemperature,    // Trigger calc on typing
            ),

            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:",
                style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10),

            // 5. Display the result
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                // If empty, show '0', otherwise show result
                conversionResult.isEmpty ? '0' : conversionResult,
                style: const TextStyle(
                  color: Colors.black, // Make sure text is visible on white
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}