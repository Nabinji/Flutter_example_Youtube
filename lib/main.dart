import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Blog%20App%20ui/View/blog_home_page.dart';

void main() {
  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlogHomePage(),
    );
  }
}







      // theme: ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: kbackgroundColor,
      //   ),
      //   scaffoldBackgroundColor: kbackgroundColor,
      //   colorScheme: ColorScheme.fromSeed(seedColor: kprimaryColor),
      //   useMaterial3: true,
      // ),
      
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
