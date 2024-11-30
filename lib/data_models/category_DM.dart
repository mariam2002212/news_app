import 'package:flutter/material.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/core/constants_manager.dart';
import 'package:news_app/core/strings_manager.dart';

class CategoryDM {
  String id;
  String title;
  Color bgColor;
  String imagePath;

  CategoryDM(
      {required this.id,
        required this.title,
        required this.bgColor,
        required this.imagePath});

  static List<CategoryDM> getAllCategories() => [
    CategoryDM(
        id: ConstantsManager.sportsId,
        title: StringsManager.sports,
        bgColor: ColorsManager.green,
        imagePath: AssetsManager.sports),
    CategoryDM(
        id: ConstantsManager.generalId,
        title: StringsManager.general,
        bgColor: ColorsManager.darkBlue,
        imagePath: AssetsManager.general),
    CategoryDM(
        id: ConstantsManager.healthId,
        title: StringsManager.health,
        bgColor: ColorsManager.pink,
        imagePath: AssetsManager.health),
    CategoryDM(
        id: ConstantsManager.businessId,
        title: StringsManager.business,
        bgColor: ColorsManager.brown,
        imagePath: AssetsManager.business),
    CategoryDM(
        id: ConstantsManager.entertainmentId,
        title: StringsManager.entertainment,
        bgColor: ColorsManager.red,
        imagePath: AssetsManager.entertainment),
    CategoryDM(
        id: ConstantsManager.scienceId,
        title: StringsManager.science,
        bgColor: ColorsManager.yellow,
        imagePath: AssetsManager.science),
    CategoryDM(
        id: ConstantsManager.techId,
        title: StringsManager.tech,
        bgColor: ColorsManager.green,
        imagePath: AssetsManager.technology),
  ];
  static get(){
    print('Hello');
  }
}