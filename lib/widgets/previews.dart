import 'package:flutter/material.dart';

import '../models/models.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentLists;

  const Previews({Key? key, required this.title, required this.contentLists})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 165,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 8,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: contentLists.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentLists[index];
              return ItemReview(content: content);
            },
          ),
        )
      ],
    );
  }
}

class ItemReview extends StatelessWidget {
  final Content content;

  const ItemReview({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(content.name),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(content.imageUrl),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
              border: Border.all(color: (content.color)!, width: 4),
            ),
          ),
          Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.black87,
                  Colors.black45,
                  Colors.transparent,
                ],
                stops: [0, 0.25, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              shape: BoxShape.circle,
              border: Border.all(color: (content.color)!, width: 4),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 60,
              child: Image.asset(content.titleImageUrl.toString()),
            ),
          )
        ],
      ),
    );
  }
}
