import 'package:flutter/material.dart';
import 'package:quotes/quotes.dart';

class SearchDelegratePage extends SearchDelegate {
  @override
  TextStyle? get searchFieldStyle => TextStyle(color: Colors.white);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
      scaffoldBackgroundColor: Colors.blueAccent,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white),
        border: InputBorder.none,
        labelStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildCategoryWidget();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildCategoryWidget();
  }

  Consumer buildCategoryWidget() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return ref.watch(searchCategoryFutureProvider(query)).when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                CategoryModel category = data[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      category.categoryName ?? "",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(Icons.arrow_circle_right_sharp),
                    onTap: () {
                      if (category.id != null) {
                        appRouter.push(
                          QuotesRoute(category: category),
                        );
                      }
                    },
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) {
            return Center(
              child: Text("Üzgünüz Bir Hata Oluştu:"),
            );
          },
          loading: () {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
