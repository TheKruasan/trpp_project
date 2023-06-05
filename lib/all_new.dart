import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trpp_proj/news.dart';
import 'package:flutter/services.dart';
import 'package:trpp_proj/one_news.dart';

class AllNews extends StatefulWidget {
  final String value;
  const AllNews({required this.value, super.key});
  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<News> news = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
                children: [
                  ...news.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        color: Colors.amber,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: OneNew(news: e),
                      ),
                    ),
                  )
                ],
              );
            default:
              return CircularProgressIndicator();
          }
        });
  }

  final Dio _dio = Dio();

  getData() async {
    try {
      // _dio.post(
      //   "http://127.0.0.1:8080",
      // );
      // final response = await rootBundle.loadString("pac.json");
      final response = await _dio
          .get("http://localhost:8080/post/getByCourseOrGroup/INBO-05-21");
      var data = response.data;
      // news = newsFromJson(response);
      print(news);
      news = data.map<News>((news) => News.fromJson(news)).toList();
    } on DioError catch (e) {
      print(e);
    }
    return news;
  }
}
