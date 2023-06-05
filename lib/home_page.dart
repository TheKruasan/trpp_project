import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trpp_proj/all_new.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<int> data = [1, 2, 2, 3, 4, 5, 6, 7, 8, 8, 8, 8, 8, 8, 8, 7];
TextEditingController _controller = TextEditingController();

class _HomePageState extends State<HomePage> {
  Dio _dio = Dio();
  String group = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 20,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Новости МИРЭА!",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: SizedBox(
            //     width: MediaQuery.of(context).size.width / 2,
            //     child: Form(
            //       child: TextFormField(
            //         controller: _controller,
            //         decoration:
            //             const InputDecoration(border: OutlineInputBorder()),
            //       ),
            //     ),
            //   ),
            // ),

            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        group = _controller.text;
                      },
                      icon: Icon(Icons.last_page_outlined),
                    ),
                  ),
                ),
              ),
            ),

            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Container(
            //     width: MediaQuery.of(context).size.width / 2,
            //     child: Row(
            //       children: [
            //         Form(
            //           child: TextFormField(
            //             controller: _controller,
            //             decoration:
            //                 const InputDecoration(border: OutlineInputBorder()),
            //           ),
            //         ),
            //         IconButton(
            //             onPressed: () {}, icon: Icon(Icons.last_page_rounded))
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              alignment: Alignment.center,
              child: AllNews(
                value: group,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
