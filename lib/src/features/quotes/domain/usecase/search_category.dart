import 'package:quotes/quotes.dart';

class SearchCategoryUseCase {
  final QuotesRepository repository;
  SearchCategoryUseCase(this.repository);
  Future<List<CategoryModel>> call(query) async {
    try {
      return await repository.searchCategory(query: query);
    } catch (e, st) {
      logger.e(e);
      logger.e(st);
      rethrow;
    }
  }
}
