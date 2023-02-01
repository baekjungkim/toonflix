import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String genre, age, about;

  const InfoWidget({
    super.key,
    required this.genre,
    required this.age,
    required this.about,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$genre / $age',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          about,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
