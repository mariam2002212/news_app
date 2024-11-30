import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_txt_styles.dart';
import 'package:news_app/core/colors_manager.dart';

class AppTheme {

  static final ThemeData light = ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(
            color: ColorsManager.white
        ),
        color: ColorsManager.green,
        centerTitle: true,

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.r))
        ),
        titleTextStyle: AppTxtStyles.appBar,
      ),
      scaffoldBackgroundColor: Colors.transparent
  );

}