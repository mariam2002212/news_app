import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_txt_styles.dart';
import 'package:news_app/data_models/category_DM.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/category_widget/category_widget.dart';

typedef OnCategoryClicked = void Function(CategoryDM);
class Categories extends StatelessWidget {
  Categories({super.key, required this.onCategoryClicked});
  OnCategoryClicked onCategoryClicked;

  List<CategoryDM> categoriesList = CategoryDM.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            'Pick your category\nof interest',
            style: AppTxtStyles.pickCategory,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 25,
                crossAxisSpacing: 20,
              ),
              itemCount: categoriesList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryClicked(categoriesList[index]);
                },
                child: CategoryWidget(
                    categoryDM: categoriesList[index], index: index),
              ),
            ),
          )
        ],
      ),
    );
  }
}