import 'package:flutter/material.dart';

import '../../Responsive/responsive.dart';
import 'social_icon.dart';

class SocialIconsBar extends StatelessWidget {
  const SocialIconsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      top: Utils.mdqh(context) * 0.2,
      child: const SizedBox(
        height: 300,
        width: 35,
        child: Column(
          children: [
            SocialIcon(
                imgURL:
                    'https://eager-williams-af0d00.netlify.app/assets/icons/icons8-twitter-circled.gif'),
            SocialIcon(
                imgURL:
                    'https://eager-williams-af0d00.netlify.app/assets/icons/icons8-instagram.gif'),
            SocialIcon(
                imgURL:
                    'https://eager-williams-af0d00.netlify.app/assets/icons/icons8-linkedin-circled.gif'),
            SocialIcon(
                imgURL:
                    'https://eager-williams-af0d00.netlify.app/assets/icons/icons8-github.gif'),
          ],
        ),
      ),
    );
  }
}
