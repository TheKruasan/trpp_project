import 'package:flutter/material.dart';
import 'package:trpp_proj/news.dart';

class OneNew extends StatelessWidget {
  final News news;
  const OneNew({required this.news, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        news.imageUrl,
        fit: BoxFit.cover,
      ),
      subtitle: Text(news.content),
      title: Text(news.header),
    );
  }
}
