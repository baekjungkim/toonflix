import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EpisodeWidget extends StatelessWidget {
  final WebtoonEpisodeModel episode;
  final String webtoonId;

  const EpisodeWidget({
    super.key,
    required this.episode,
    required this.webtoonId,
  });

  void onGoNaverToon() async {
    await launchUrlString(
        'https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onGoNaverToon,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.green.shade300,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
                weight: 600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
