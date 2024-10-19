import 'package:quotes/quotes.dart';

class GetCategoriesUseCase {
  final QuotesRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<CategoryModel>> call(int page) async {
    try {
      return await repository.getCategories(page: page);
    } catch (e, st) {
      logger.e(e);
      logger.e(st);
      rethrow;
    }
  }
}
