import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/servicesmodel/artical_model.dart';
import 'package:newsapp/services/news_services.dart';
import 'package:newsapp/widget/news_listview.dart';

class NewsLsitViewBuilder extends StatefulWidget {
  const NewsLsitViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsLsitViewBuilder> createState() => _NewsLsitViewBuilderState();
}

class _NewsLsitViewBuilderState extends State<NewsLsitViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsServices(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(articals: snapshot.data!);
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 300),
                child:
                    Center(child: Text("hata oluştu kısa sürede giderilecek ")),
              ),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 300),
                child: Center(child: CircularProgressIndicator()),
              ),
            );
          }
        });
  }
}
















// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:newsapp/model/servicesmodel/artical_model.dart';
// import 'package:newsapp/services/news_services.dart';
// import 'package:newsapp/widget/news_listview.dart';

// class NewsLsitViewBuilder extends StatefulWidget {
//   const NewsLsitViewBuilder({
//     super.key,
//   });

//   @override
//   State<NewsLsitViewBuilder> createState() => _NewsLsitViewBuilderState();
// }

// class _NewsLsitViewBuilderState extends State<NewsLsitViewBuilder> {
//   List<ArticleModel> articals = [];
//   bool isLoading = true;
//   @override
//   void initState() {
//     super.initState();
//     getGeneralNews();
//     isLoading = false;
//   }

//   Future<void> getGeneralNews() async {
//     articals = await NewsServices(Dio()).getNews();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? const SliverToBoxAdapter(
//             child: Center(
//                 child: Padding(
//             padding: EdgeInsets.only(top: 300),
//             child: CircularProgressIndicator(),
//           )))
//         : articals.isNotEmpty
//             ? NewsListView(articals: articals)
//             : const SliverToBoxAdapter(
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 300),
//                   child: Center(
//                       child: Text("hata oluştu kısa sürede giderilecek ")),
//                 ),
//               );
//   }
// }

