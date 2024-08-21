import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text('BMI Calculator App'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: context.read<BMIProvider>().heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                filled: true,
                fillColor: Colors.white38,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: context.read<BMIProvider>().weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                filled: true,
                fillColor: Colors.white38,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<BMIProvider>().calculateBMI(),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 20),
            Consumer<BMIProvider>(
              builder: (context, provider, child) {
                Color categoryColor = provider.bmiCategory ==
                            'You have a Underweight\n(BMI less than 18.5)' ||
                        provider.bmiCategory ==
                            'You have a Overweight\n( BMI 25 - 29.9)' ||
                        provider.bmiCategory == 'Obesity\nBMI 30 or higher'
                    ? Colors.red
                    : Colors.green;

                return Column(
                  children: [
                    Text(
                      provider.bmi == 0
                          ? ''
                          : 'Your BMI: ${provider.bmi.toStringAsFixed(1)} kg/m2',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      provider.bmiCategory,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: categoryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
