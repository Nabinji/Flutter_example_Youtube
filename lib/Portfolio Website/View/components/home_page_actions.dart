import 'package:flutter/material.dart';

import '../../Responsive/responsive.dart';

class HomePageActions extends StatelessWidget {
  final ScrollController sc;
  const HomePageActions({super.key, required this.sc});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Utils.isMobile(context);
    return isMobile
        ? Column(
            children: getWidgets(sc, context, isMobile: true),
          )
        : Row(
            children: getWidgets(sc, context),
          );
  }

  List<Widget> getWidgets(ScrollController sc, BuildContext context,
      {bool isMobile = false}) {
    int scrollDur = isMobile ? 800 : 500;
    return [
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 20 : 0),
        child: TextButton(
          onPressed: () {
            if (isMobile) Navigator.pop(context);
            sc.animateTo(
              200,
              duration: Duration(milliseconds: scrollDur),
              curve: Curves.easeIn,
            );
          },
          child: const Text(
            'About',
            style: TextStyle(
              fontSize: 17,
              color: Color(0xFf4756DF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 20 : 0),
        child: TextButton(
          onPressed: () {
            if (isMobile) Navigator.pop(context);
            sc.animateTo(
              isMobile ? 1100 : 800,
              duration: Duration(milliseconds: scrollDur),
              curve: Curves.easeIn,
            );
          },
          child: const Text(
            'Skills',
            style: TextStyle(
              fontSize: 17,
              color: Color(0xFf4756DF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 20 : 0),
        child: TextButton(
          onPressed: () {
            if (isMobile) Navigator.pop(context);
            sc.animateTo(
              1400,
              duration: Duration(milliseconds: scrollDur),
              curve: Curves.easeIn,
            );
          },
          child: const Text(
            'Projects',
            style: TextStyle(
              fontSize: 17,
              color: Color(0xFf4756DF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 20 : 0),
        child: TextButton(
          onPressed: () {
            if (isMobile) Navigator.pop(context);
            sc.animateTo(
              isMobile ? 2600 : 1900,
              duration: Duration(milliseconds: scrollDur),
              curve: Curves.easeIn,
            );
          },
          child: const Text(
            'Contact',
            style: TextStyle(
              fontSize: 17,
              color: Color(0xFf4756DF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      )
    ];
  }
}
