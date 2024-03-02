import 'package:flutter/material.dart';
import 'package:newsapp/model/category_model.dart';
import 'package:newsapp/widget/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  final List<CategoryModel> categorise = const [
    CategoryModel(
      categoryName: 'Business',
      image: 'assets/business.avif',
    ),
    CategoryModel(
      categoryName: 'Entertainment',
      image: 'assets/entertaiment.avif',
    ),
    CategoryModel(
      categoryName: 'Health',
      image: 'assets/health.avif',
    ),
    CategoryModel(
      categoryName: 'Science',
      image: 'assets/science.avif',
    ),
    CategoryModel(
      categoryName: 'Sports',
      image: 'assets/sports.avif',
    ),
    CategoryModel(
      categoryName: 'Technology',
      image: 'assets/technology.jpeg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categorise.length,
          itemBuilder: (context, index) {
            return  CategoryCard(category:categorise[index],);
          }),
    );
  }
}
