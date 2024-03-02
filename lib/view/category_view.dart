import 'package:flutter/material.dart';
import 'package:newsapp/widget/new_slistview_builder.dart';

class CategoryNewsView extends StatelessWidget {
  const CategoryNewsView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(category),
        ),
        body: CustomScrollView(
          slivers: [
            NewsLsitViewBuilder(
              category: category,
            )
          ],
        ));
  }
}
