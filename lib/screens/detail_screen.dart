import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail_dodel.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/card_widget.dart';
import 'package:toonflix/widgets/episode_widget.dart';
import 'package:toonflix/widgets/heart_icon_widget.dart';
import 'package:toonflix/widgets/info_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        centerTitle: true,
        actions: [
          HeartIconWidget(id: widget.id),
        ],
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 40,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardWidget(
                    thumb: widget.thumb,
                    id: widget.id,
                    size: 250,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? const Text('...')
                      : InfoWidget(
                          genre: snapshot.data!.genre,
                          age: snapshot.data!.age,
                          about: snapshot.data!.about,
                        );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? Container()
                      : Flexible(
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              var episode = snapshot.data![index];
                              return EpisodeWidget(
                                episode: episode,
                                webtoonId: widget.id,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
