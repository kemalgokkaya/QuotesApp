import 'package:quotes/quotes.dart';

class DataQuotesRepository extends QuotesRepository {
  final BaseRepository _baseRepository;

  static final DataQuotesRepository _instance =
      DataQuotesRepository._internal();

  factory DataQuotesRepository() {
    return _instance;
  }
  DataQuotesRepository._internal() : _baseRepository = DataBaseRepository();

  @override
  Future<List<CategoryModel>> getCategories(
      {int? limit, required int page}) async {
    try {
      Response response = await _baseRepository.executeRequest(
        requestType: RequestType.get,
        path: categoryUrl(page, limit ?? 30),
      );
      return (response.data as List)
          .map((val) => CategoryModel.fromJson(val))
          .toList();
    } catch (e, st) {
      logger.e(e);
      logger.e(st);
      rethrow;
    }
  }

  @override
  Future<List<QuoteModel>> getQuotes({required int categoryId}) async {
    try {
      Response response = await _baseRepository.executeRequest(
        requestType: RequestType.get,
        path: detailCategoryUrl(categoryId),
      );
      return (response.data as List)
          .map((val) => QuoteModel.fromJson(val))
          .toList();
    } catch (e, st) {
      logger.e(e);
      logger.e(st);
      rethrow;
    }
  }

  @override
  Future<List<CategoryModel>> searchCategory({required String query}) async {
    try {
      Response response = await _baseRepository.executeRequest(
        requestType: RequestType.get,
        path: searchCategoryUrl(query),
      );
      return (response.data as List)
          .map((val) => CategoryModel.fromJson(val))
          .toList();
    } catch (e, st) {
      logger.e(e);
      logger.e(st);
      rethrow;
    }
  }
}
