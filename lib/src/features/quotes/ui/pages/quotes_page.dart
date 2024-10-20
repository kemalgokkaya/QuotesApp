import 'package:flutter/material.dart';
import 'package:quotes/quotes.dart';

@RoutePage()
class QuotesPage extends ConsumerStatefulWidget {
  final int id;
  const QuotesPage({super.key, required this.id});

  @override
  ConsumerState<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends ConsumerState<QuotesPage> {
  @override
  void initState() {
    super.initState();
    ref.read(quotesPresenterProvider.notifier).getQuotes(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    List<QuoteModel> quotes = ref.watch(quotesPresenterProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.blueAccent),
        child: ListView.builder(
          itemCount: quotes.length,
          itemBuilder: (context, index) {
            QuoteModel quote = quotes[index];
            return Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                title: Text(
                  quote.word ?? "",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.content_copy,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
