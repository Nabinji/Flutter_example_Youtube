import 'package:flutter/material.dart';
import 'package:flutter_example/Bmi%20Calculator/provider.dart';
import 'package:provider/provider.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text("BMI Calculator App"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: context.read<BMIProvider>().heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Height (cm)",
                labelStyle: const TextStyle(color: Colors.black),
                fillColor: Colors.white38,
                filled: true,
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
                labelText: "Weight (kg)",
                labelStyle: const TextStyle(color: Colors.black),
                fillColor: Colors.white38,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<BMIProvider>().calculateBMI(),
              child: const Text("Calculate BMI"),
            ),
            const SizedBox(height: 20),
            Consumer<BMIProvider>(builder: (context, provider, child) {
              // it  means if the weight is over, less or obesity show it in red color otherwiser green
              Color categoryColor = provider.bmiCategory ==
                          "You have a UnderWeight\n(BMI less then 18.5)" ||
                      provider.bmiCategory ==
                          "You have a  OverWeight\n(BMI 25 - 29.9)" ||
                      provider.bmiCategory == "Obesity\n BMI 30 or higher"
                  ? Colors.red
                  : Colors.green;
              return Column(
                children: [
                  Text(
                    provider.bmi == 0
                        ? ''
                        : "Your BMI:${provider.bmi.toStringAsFixed(1)} kg/m2",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const  SizedBox(height: 10),
                  Text(
                    provider.bmiCategory,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: categoryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
