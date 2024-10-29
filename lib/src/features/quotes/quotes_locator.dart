import 'package:quotes/quotes.dart';

final getCategoriesUseCase =
    Provider((ref) => GetCategoriesUseCase(DataQuotesRepository()));
final getQuotesUseCase =
    Provider((ref) => GetQuotesUseCase(DataQuotesRepository()));
final searchCategoryUseCase =
    Provider((ref) => SearchCategoryUseCase(DataQuotesRepository()));
