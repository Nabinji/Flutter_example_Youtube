import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('© Copyright 2021'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Built with ❤ by'),
            TextButton(
              onPressed: () {},
              child: const Text('Pradeep Tintali'),
            ),
          ],
        )
      ],
    );
  }
}
