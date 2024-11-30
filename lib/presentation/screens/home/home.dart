//
// import 'package:flutter/material.dart';
// import 'package:news_app/core/assets_manager.dart';
// import 'package:news_app/core/colors_manager.dart';
// import 'package:news_app/data_models/category_DM.dart';
// import 'package:news_app/presentation/screens/home/home_drawer/home_drawer.dart';
// import 'package:news_app/presentation/screens/home/tabs/categories/categories.dart';
// import 'package:news_app/presentation/screens/home/tabs/categories/category_details/category_details.dart';
// import 'package:news_app/presentation/screens/home/tabs/settings/settings.dart';
//
// class Home extends StatefulWidget {
//   Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   late Widget selectedWidget = Categories(onCategoryClicked: onCategoryClicked);
//   String appBarTitle = 'News App';
//   bool showSearchIcon = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: ColorsManager.white,
//         image: DecorationImage(image: AssetImage(AssetsManager.bgPattern)),
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(appBarTitle),
//           actions: showSearchIcon
//               ? [
//             IconButton(
//               icon: const Icon(Icons.search),
//               onPressed: () {
//                 // Handle the search button click
//                 print('Search button clicked!');
//               },
//             ),
//           ]
//               : null,
//         ),
//         drawer: HomeDrawer(
//           onMenuItemClicked: onDrawerItemClick,
//         ),
//         body: selectedWidget,
//       ),
//     );
//   }
//
//   void onCategoryClicked(CategoryDM categoryDM) {
//     selectedWidget = CategoryDetails(categoryDM: categoryDM);
//     appBarTitle = categoryDM.title;
//     showSearchIcon = true;
//     setState(() {});
//   }
//
//   void onDrawerItemClick(MenuItem item) {
//     Navigator.pop(context);
//     if (item == MenuItem.categories) {
//       selectedWidget = Categories(onCategoryClicked: onCategoryClicked);
//       appBarTitle = 'News App';
//       showSearchIcon = false;
//     } else if (item == MenuItem.settings) {
//       selectedWidget = Settings();
//       appBarTitle = 'Settings';
//       showSearchIcon = false;
//     }
//     setState(() {});
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/articles_response/articles_response.dart';
import 'package:news_app/data_models/category_DM.dart';
import 'package:news_app/presentation/screens/home/SearchResultsWidget.dart';
import 'package:news_app/presentation/screens/home/home_drawer/home_drawer.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/categories.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/category_details/category_details.dart';
import 'package:news_app/presentation/screens/home/tabs/settings/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget selectedWidget = Categories(onCategoryClicked: onCategoryClicked);
  String appBarTitle = 'News App';
  bool showSearchIcon = false;
  bool isSearching = false; // Controls whether the search bar is active
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(image: AssetImage(AssetsManager.bgPattern)),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: isSearching
              ? TextField(
            controller: searchController,
            autofocus: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorsManager.white,
              hintText: 'Search articles...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              hintStyle: TextStyle(color: ColorsManager.green),
            ),
            style: const TextStyle(color: ColorsManager.green),
            onSubmitted: (query) {
              performSearch(query);
            },
          )
              : Text(appBarTitle),
          actions: showSearchIcon
              ? [
            IconButton(
              icon: Icon(isSearching ? Icons.close : Icons.search),
              onPressed: () {
                setState(() {
                  if (isSearching) {
                    // Exit search mode
                    isSearching = false;
                    searchController.clear();
                  } else {
                    // Enter search mode
                    isSearching = true;
                  }
                });
              },
            ),
          ]
              : null,
        ),
        drawer: HomeDrawer(
          onMenuItemClicked: onDrawerItemClick,
        ),
        body: selectedWidget,
      ),
    );
  }

  void onCategoryClicked(CategoryDM categoryDM) {
    selectedWidget = CategoryDetails(categoryDM: categoryDM);
    appBarTitle = categoryDM.title;
    showSearchIcon = true;
    isSearching = false;
    setState(() {});
  }

  void onDrawerItemClick(MenuItem item) {
    Navigator.pop(context);
    if (item == MenuItem.categories) {
      selectedWidget = Categories(onCategoryClicked: onCategoryClicked);
      appBarTitle = 'News App'; // Reset title
      showSearchIcon = false; // Hide search icon for non-category screens
      isSearching = false; // Reset search mode
    } else if (item == MenuItem.settings) {
      selectedWidget = const Settings();
      appBarTitle = 'Settings'; // Update title
      showSearchIcon = false; // Hide search icon for non-category screens
      isSearching = false; // Reset search mode
    }
    setState(() {});
  }

  void performSearch(String query) async {
    if (query.isEmpty) return;
    try {
      ArticlesResponse articlesResponse = await ApiManager.searchArticles(query);
      setState(() {
        selectedWidget = SearchResultsWidget(articles: articlesResponse.articles ?? []);
        isSearching = false;
      });
    } catch (error) {
      print('Error fetching search results: $error');
    }
  }
}
