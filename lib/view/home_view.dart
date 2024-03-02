import 'package:flutter/material.dart';
import 'package:newsapp/widget/category_listview.dart';
import 'package:newsapp/widget/new_slistview_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'news',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(
                ' cloude',
                style:
                    TextStyle(fontWeight: FontWeight.w700, color: Colors.amber),
              )
            ],
          ),
        ),
        body: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CategoryListView(),
            ),
            NewsLsitViewBuilder(
              category: 'general',
            )
          ],
        ));
  }
}
