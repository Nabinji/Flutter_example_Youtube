import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Burger%20App%20UI/bottom_nav_bar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.network(
                "https://img.freepik.com/free-photo/delicious-burger-with-fresh-ingredients_23-2150857908.jpg?t=st=1723528095~exp=1723531695~hmac=6eb37d84d0b2df449521cbfe0d78148fd5d9c99a1e0b59aae17b1611c687ad44&w=1060",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                SizedBox(height: size.height * 0.05),
                const Text(
                  "             👑",
                  style: TextStyle(fontSize: 25),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BURGER \nQueen",
                      style: TextStyle(
                        height: 0.8,
                        fontFamily: "Arial",
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.53),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Good Food \nTasty Food*",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 172, 109, 8),
                          height: 1.2,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 43,
                        ),
                      ),
                      SizedBox(height: size.height * 0.04),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MyBottomNavBar(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber[800],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 17,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
