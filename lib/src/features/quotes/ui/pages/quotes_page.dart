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
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: ListView.builder(
                itemCount: quotes.length,
                itemBuilder: (context, index) {
                  final quote = quotes[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title: Text(
                        quote.word ?? "",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: AdMobBanner(),
          ),
        ],
      ),
    );
  }
}
