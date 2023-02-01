import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String thumb;

  const CardWidget({
    super.key,
    required this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(7, 7),
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Image.network(thumb),
    );
  }
}
