import 'package:quotes/quotes.dart';

abstract class BaseRepository {
  Future<Response> executeRequest(
      {required RequestType requestType, required String path, data});
}
