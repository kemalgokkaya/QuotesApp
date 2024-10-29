import 'package:quotes/quotes.dart';

class HomePresenter extends StateNotifier<List<CategoryModel>> {
  final Ref ref;
  HomePresenter(this.ref) : super([]) {
    getCategories();
  }

  Future getCategories() async {
    List<CategoryModel> response = await ref.read(getCategoriesUseCase).call(1);
    state = response;
  }
}

final homePresenterProvider =
    StateNotifierProvider<HomePresenter, List<CategoryModel>>((ref) {
  return HomePresenter(ref);
});

final loadingProvider = StateProvider<bool>((ref) => true);

final searchCategoryFutureProvider = FutureProvider.autoDispose
    .family<List<CategoryModel>, String>((ref, query) async {
  ref.cacheFor(Duration(seconds: 60));
  List<CategoryModel> response =
      await ref.read(searchCategoryUseCase).call(query);
  return response;
});
