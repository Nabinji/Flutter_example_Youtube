import 'package:flutter/material.dart';

import '../../Responsive/responsive portfolio.dart';
import 'skill_card.dart';

class TopSkills extends StatelessWidget {
  const TopSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'My Top Skills',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal:Utils.isMobile(context)? 10:Utils.mdqw(context) / 4,
          ),
          child: const Wrap(
            children: [
              SkillCard(
                url:
                    'https://cdn.iconscout.com/icon/free/png-256/flutter-2038877-1720090.png',
              ),
              SkillCard(
                url:
                    'https://user-images.githubusercontent.com/26507463/53453892-49908900-3a04-11e9-9dce-77ed3d694326.png',
              ),
              SkillCard(
                  url:
                      'https://cdn4.iconfinder.com/data/icons/google-i-o-2016/512/google_firebase-2-512.png'),
              SkillCard(
                  url: 'https://cdn-icons-png.flaticon.com/512/226/226777.png'),
              SkillCard(
                  url: 'https://cdn.iconscout.com/icon/free/png-256/python-3521655-2945099.png'),
              SkillCard(
                  url:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Git_icon.svg/1024px-Git_icon.svg.png'),
            ],
          ),
        ),
      ],
    );
  }
}
