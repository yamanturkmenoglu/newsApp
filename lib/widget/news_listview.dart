import 'package:flutter/material.dart';
import 'package:newsapp/model/servicesmodel/artical_model.dart';

import 'package:newsapp/widget/news_title.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articals;

  const NewsListView({super.key, required this.articals});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: articals.length,
            (context, index) {
      return NewsTile(
        articleModel: articals[index],
      );
    }));
  }
}
