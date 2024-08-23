import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Coffee%20Shope%20App%20UI/View/coffee_shope_home.dart';
import '../Utils/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 50,
                width: 90,
                child: Image.asset("image/coffee-shop-image/logo.png"),
              ),
              const SizedBox(height: 5),
              const Text(
                "KOKUMI",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                "The Best",
                style: TextStyle(
                  height: 0.7,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CoffeeHomeScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: buttonColor),
                      child: const Center(
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: buttonColor),
                    ),
                    child: const Center(
                      child: Text(
                        "Register",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  socialLoginButton(
                    "https://cdn.freebiesupply.com/logos/large/2x/google-icon-logo-png-transparent.png",
                    "Connect with Google",
                    Colors.black,
                    Colors.white,
                  ),
                  const SizedBox(height: 20),
                  socialLoginButton(
                      "https://static.vecteezy.com/system/resources/previews/021/495/960/original/facebook-logo-icon-free-png.png",
                      "Connect with Facebook",
                      Colors.white,
                      facebookButtondColor),
                ],
              ),
              const SizedBox(height: 25),
              Expanded(
                child: Image.asset("image/coffee-shop-image/LoginCoffee.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container socialLoginButton(image, title, textColor, color) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Row(
        children: [
          const SizedBox(width: 55),
          Image.network(
            image,
            height: 25,
          ),
          const SizedBox(width: 15),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          )
        ],
      ),
    );
  }
}
