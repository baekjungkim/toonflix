import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';
import 'package:toonflix/widgets/card_widget.dart';

class WebtoonWidget extends StatelessWidget {
  final String title, thumb, id;

  const WebtoonWidget({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          CardWidget(
            thumb: thumb,
            id: id,
            size: 180,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
