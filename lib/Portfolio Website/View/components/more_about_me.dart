import 'package:flutter/material.dart';

import '../../Responsive/responsive.dart';

class MoreAboutMe extends StatelessWidget {
  const MoreAboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Utils.isMobile(context) ? 40 : 80),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Center(
              child: Text(
                'More About Me',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Text(
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis nesciunt excepturi quos obcaecati incidunt voluptatem ipsam sunt ipsum, autem deleniti cupiditate molestias quis unde quae totam porro dicta iure animi inventore, veniam hic! Omnis nulla, delectus a voluptatibus',
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Consequuntur nostrum dolor minus, libero delectus praesentium perferendis',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Text(
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero, consequuntur labore? Ea totam voluptas amet!',
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
