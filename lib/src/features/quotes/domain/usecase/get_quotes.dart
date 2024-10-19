import 'package:quotes/quotes.dart';

class GetQuotesUseCase {
  final QuotesRepository repository;

  GetQuotesUseCase(this.repository);

  Future<List<QuoteModel>> call(int categoryId) async {
    try {
      return await repository.getQuotes(categoryId: categoryId);
    } catch (e, st) {
      logger.e(e);
      logger.e(st);
      rethrow;
    }
  }
}
