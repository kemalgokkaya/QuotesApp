import 'package:flutter/material.dart';
import 'package:quotes/quotes.dart';

@RoutePage()
class QuotesPage extends ConsumerStatefulWidget {
  final CategoryModel category;
  const QuotesPage({super.key, required this.category});

  @override
  ConsumerState<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends ConsumerState<QuotesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((val) {
      ref.read(quotesPresenterProvider.notifier).getQuotes(widget.category.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<QuoteModel> quotes = ref.watch(quotesPresenterProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          widget.category.categoryName ?? "Sözler",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.blueAccent),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: quotes.length,
                itemBuilder: (context, index) {
                  QuoteModel quote = quotes[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title: Text(
                        quote.word ?? "",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.content_copy,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            AdMobBanner(),
          ],
        ),
      ),
    );
  }
}
