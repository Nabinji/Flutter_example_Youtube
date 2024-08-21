import 'package:flutter/material.dart';
import 'package:flutter_example/Bmi%20Calculator/bmi_calculator.dart';
import 'package:provider/provider.dart';

import 'Bmi Calculator/provider.dart';

void main() {
  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BMIProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BmiCalculator(),
      ),
    );
  }
}





// for provider only
// Widget build(BuildContext context) {
//   return MultiProvider(
//     providers: [
//       ChangeNotifierProvider<JokeProviderServices>(
//         create: (_) => JokeProviderServices(),
//       ),
//     ],
//     child: const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: JokeScreen(),
//     ),
//   );
// }
