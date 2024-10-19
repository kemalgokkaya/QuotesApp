import 'package:quotes/quotes.dart';

class QuotesPresenter extends StateNotifier<List<QuoteModel>> {
  final Ref ref;
  QuotesPresenter(this.ref) : super([]);

  Future getQuotes(categoryId) async {
    List<QuoteModel> response =
        await ref.read(getQuotesUseCase).call(categoryId);
    state = response;
  }
}

final quotesPresenterProvider =
    StateNotifierProvider<QuotesPresenter, List<QuoteModel>>((ref) {
  return QuotesPresenter(ref);
});
