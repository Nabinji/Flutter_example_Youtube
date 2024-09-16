import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? pressed;

  const MyIconButton({
    super.key,
    required this.icon,
    this.pressed,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:pressed,
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.white,
        fixedSize: const Size(50, 50),
      ),
      icon: Icon(icon),
    );
  }
}
