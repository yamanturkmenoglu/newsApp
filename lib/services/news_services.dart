import 'package:dio/dio.dart';
import 'package:newsapp/model/servicesmodel/artical_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    // ignore: unused_local_variable
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=199ecce842ad43de9f4e0d8dbef6b68e&category=$category');
      Map<String, dynamic> jsonData = response.data;
      // ignore: unused_local_variable
      List<dynamic> articles = jsonData["articles"];

      List<ArticleModel> articlesList = [];
      for (var artical in articles) {
        ArticleModel articleModel = ArticleModel(
            title: artical['title'],
            description: artical['description'],
            imageUrl: artical['urlToImage'],
             url:artical ['url']);
            
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
