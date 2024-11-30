// import 'package:flutter/material.dart';
// import 'package:news_app/data/api/api_manager/api_manager.dart';
// import 'package:news_app/data/api/model/sources_response/source.dart';
// import 'package:news_app/data_models/category_DM.dart';
//
// class CategoryDetails extends StatelessWidget {
//   CategoryDetails({super.key, required this.categoryDM});
//
//   CategoryDM categoryDM;
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(future: ApiManager.getSources(categoryDM.id),
//       builder: (context, snapshot) {
//       if(snapshot.connectionState == ConnectionState.waiting){
//         return const Center(child: CircularProgressIndicator());
//       }
//       if(snapshot.hasError){
//         return Text(snapshot.error.toString());
//       }
//       List<Source> sources = snapshot.data?.sources?? [];
//       return ListView.builder(
//         itemBuilder: (context, index) {
//         Text(sources[index].name ?? ' ');
//       },itemCount: sources.length,);
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:news_app/data_models/category_DM.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/category_details/category_details_widgets/source_widget.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.categoryDM});

  CategoryDM categoryDM;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryDM.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        //we have got all the sources by the given category id
        List<Source> sources = snapshot.data?.sources ?? [];
        // return ListView.builder(
        //   itemCount: sources.length,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       title: Text(sources[index].name ?? 'No Name Available'),
        //     );
        //   },
        // );
        return SourceWidget(sources: sources);
      },
    );
  }
}
