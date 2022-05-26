import 'package:flutter/material.dart';

import '../models/models.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;

  const ContentList(
      {Key? key,
      required this.title,
      required this.contentList,
      this.isOriginals = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: isOriginals ? 500 : 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];
              return ContentItem(
                content: content,
                isOriginals: isOriginals,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ContentItem extends StatelessWidget {
  final Content content;
  final bool isOriginals;
  const ContentItem(
      {Key? key, required this.content, required this.isOriginals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(content.name),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: isOriginals ? 400 : 200,
        width: isOriginals ? 200 : 130,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(content.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
