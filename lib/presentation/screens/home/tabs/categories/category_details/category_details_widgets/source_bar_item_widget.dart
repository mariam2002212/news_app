import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_txt_styles.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';

class SourceBarItemWidget extends StatelessWidget {
  Source source;
  bool isSelectedTab;
  SourceBarItemWidget({super.key, required this.source, required this.isSelectedTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: ColorsManager.green,width: 2.w),
        color: isSelectedTab? ColorsManager.green : ColorsManager.white
      ),
      child: Text(source.name??'', style: isSelectedTab? AppTxtStyles.selectedLabel: AppTxtStyles.unSelectedLabel),
    );
  }
}
