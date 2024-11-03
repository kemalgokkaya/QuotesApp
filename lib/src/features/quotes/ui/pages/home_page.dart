import 'package:flutter/material.dart';
import 'package:quotes/quotes.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = ref.watch(homePresenterProvider);
    bool loading = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "Kategoriler",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchDelegratePage());
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
              !loading) {
            loading = true;
            ref
                .read(homePresenterProvider.notifier)
                .getCategories()
                .then((val) {
              loading = false;
            });
          }
          return false;
        },
        child: Container(
          color: Colors.blueAccent,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        CategoryModel category = categories[index];
                        return Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text(
                              category.categoryName ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Icon(Icons.arrow_circle_right_sharp,
                                color: Colors.white),
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
                    ),
                  ],
                ),
              ),
              AdMobBanner(),
            ],
          ),
        ),
      ),
    );
  }
}
