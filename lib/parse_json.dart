// import 'package:dio/dio.dart';
// import 'package:trpp_proj/news.dart';
// import 'package:flutter/services.dart';

// abstract class Repository {
//   Future<List<News>> getData();
// }

// class RepositoryImpl implements Repository {
//   final Dio _dio = Dio();

//   @override
//   Future<List<News>> getData() async {
//     List<News> news = [];
//     try {
//       final response = await rootBundle.loadString("assets/package.json");
//       // final response = await _dio.get("assets/package.json");
//       news = newsFromJson(response);
//       // news = data.map<News>((news) => News.fromJson(news)).toList();
//     } on DioError catch (e) {
//       print(e);
//     }
//     return news;
//   }
// }
