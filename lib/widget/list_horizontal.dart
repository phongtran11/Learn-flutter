import 'package:flutter/material.dart';

class ListHorizontal extends StatelessWidget {
  final List movieData;
  final String titleList;
  double height;
  double width;

  ListHorizontal({
    Key? key,
    required this.movieData,
    required this.titleList,
    this.height = 160,
    this.width = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 20),
          child: Row(
            children: [
              Text(
                titleList,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: List.generate(
                movieData.length,
                (index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(movieData[index]['img']),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
