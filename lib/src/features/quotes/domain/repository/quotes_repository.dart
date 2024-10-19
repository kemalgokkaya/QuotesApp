import 'package:quotes/quotes.dart';

abstract class QuotesRepository {
  Future<List<CategoryModel>> getCategories({
    int? limit,
    required int page,
  });
  Future<List<QuoteModel>> getQuotes({required int categoryId});
}
