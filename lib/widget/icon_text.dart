import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconText({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
          ),
        )
      ],
    );
  }
}
