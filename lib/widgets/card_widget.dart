import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String thumb, id;
  final double size;

  const CardWidget({
    super.key,
    required this.thumb,
    required this.id,
    this.size = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Container(
        width: size,
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
      ),
    );
  }
}
