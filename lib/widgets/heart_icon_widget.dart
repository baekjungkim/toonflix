import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeartIconWidget extends StatefulWidget {
  final String id;

  const HeartIconWidget({
    super.key,
    required this.id,
  });

  @override
  State<HeartIconWidget> createState() => _HeartIconWidgetState();
}

class _HeartIconWidgetState extends State<HeartIconWidget> {
  late SharedPreferences prefs;
  static const String prefsKey = 'likedToons';
  bool isLiked = false;

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList(prefsKey);
    if (likedToons == null) await prefs.setStringList(prefsKey, []);
    if (likedToons != null && likedToons.contains(widget.id) == true) {
      setState(() {
        isLiked = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void onHeartTap() async {
    final likedToons = prefs.getStringList(prefsKey);
    if (likedToons == null) return;
    if (isLiked) {
      likedToons.remove(widget.id);
    } else {
      likedToons.add(widget.id);
    }
    await prefs.setStringList(prefsKey, likedToons);
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onHeartTap,
      color: Colors.green,
      icon: Icon(
        !isLiked ? Icons.favorite_outline : Icons.favorite,
      ),
    );
  }
}
