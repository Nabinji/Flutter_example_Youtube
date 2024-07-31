import 'package:flutter/material.dart';

import '../../Responsive/responsive portfolio.dart';

class Header1 extends StatelessWidget {
  const Header1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            SizedBox(
              width: Utils.isMobile(context)
                  ? Utils.mdqw(context)
                  : Utils.mdqw(context) / 2,
              height: Utils.isMobile(context)
                  ? Utils.mdqh(context) / 3
                  : Utils.mdqh(context) - 70,
              child: Padding(
                padding: Utils.isMobile(context)
                    ? const EdgeInsets.all(5.0)
                    : const EdgeInsets.only(
                        top: 50,
                        bottom: 50,
                        right: 10,
                        left: 100,
                      ),
                child: Image.asset(
                  'image/wfh_1.png',
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(
              width: Utils.isMobile(context)
                  ? Utils.mdqw(context)
                  : Utils.mdqw(context) / 2,
              height: Utils.isMobile(context)
                  ? Utils.mdqh(context) / 3
                  : Utils.mdqh(context) - 70,
              child: Center(
                child: SizedBox(
                  height: Utils.isMobile(context)
                      ? 235 / (Utils.mdqw(context) * 0.0025)
                      : 250,
                  width: Utils.isMobile(context)
                      ? Utils.mdqw(context) * 0.85
                      : 380,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 8,
                          spreadRadius: 5,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15,top: 15),
                          child: Text(
                            'About Me',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia sed dolorem fugit sapiente porro veniam pariatur dolore nostrum delectus inventore tempore minus nemo, iste ullam illo laboriosam maiores repudiandae quos!',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
