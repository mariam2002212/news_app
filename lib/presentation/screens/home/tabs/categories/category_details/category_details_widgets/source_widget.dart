import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:news_app/presentation/screens/home/tabs/articles_list/articles_list_widget.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/category_details/category_details_widgets/source_bar_item_widget.dart';

class SourceWidget extends StatefulWidget {
  List<Source> sources;
  SourceWidget({super.key, required this.sources});

  @override
  State<SourceWidget> createState() => _SourceWidgetState();
}

class _SourceWidgetState extends State<SourceWidget> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: Padding(
              padding: REdgeInsets.all(8.0),
              child: TabBar(
                indicatorColor: Colors.transparent,
                isScrollable: true,
                onTap: (index) {
                  selectedIndex=index;
                  print(selectedIndex);
                  setState(() {});
                },
                //convert each source to a tab widget
                // at the end tabs: takes List of widgets so make sure to convert it back to list
                tabs: widget.sources.map((source)=> SourceBarItemWidget(
                  source: source,
                  isSelectedTab: widget.sources.indexOf(source)== selectedIndex,)).toList(),
              ),
            )),
        ArticlesListWidget(source: widget.sources[selectedIndex]),
      ],
    );
  }
}
