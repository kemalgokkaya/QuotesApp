import 'package:flutter/material.dart';
import 'package:quotes/quotes.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = ref.watch(homePresenterProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "Quotes",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.blueAccent,
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            CategoryModel category = categories[index];
            return Container(
              margin: EdgeInsets.only(top: 10),
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
                    appRouter.push(QuotesRoute(id: category.id!));
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
