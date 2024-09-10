import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_example/Flutter%20UI/Real%20Estate%20App%20UI/Views/home_screen_real_estate.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://engineeringdiscoveries.com/wp-content/uploads/2021/07/Simple-House-Design-Plans-9.m-x9.0m-With-3-Bedroom.jpg"),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Discover dream house \nfrom smartphone",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "The No. 1 App for searching and finding \nthe most suitable house with you.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.black38,
            ),
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomeScreenRealEstate(),
                ),
              );
            },
            child: Container(
              width: 320,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Already have an account?  ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black38,
                  ),
                ),
                TextSpan(
                  text: "Log In",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
