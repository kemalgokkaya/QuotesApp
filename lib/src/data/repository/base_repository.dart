import 'package:quotes/quotes.dart';

class DataBaseRepository extends BaseRepository {
  static final DataBaseRepository _instance = DataBaseRepository._internal();

  factory DataBaseRepository() {
    return _instance;
  }
  DataBaseRepository._internal();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://ydapi.sozler.co/",
    ),
  );
  @override
  Future<Response> executeRequest(
      {required RequestType requestType, required String path, data}) async {
    try {
      logger.d(_dio.options.baseUrl + path);
      Response? response = await switch (requestType) {
        RequestType.get => _dio.get(path),
        RequestType.post => _dio.post(path, data: data),
        RequestType.put => _dio.put(path, data: data),
        RequestType.patch => _dio.patch(path, data: data),
        RequestType.delete => _dio.delete(path),
      };
      logger.d(response.requestOptions.uri);
      logger.d(response);
      return response;
    } catch (e, st) {
      logger.e(e);
      logger.e(st);
      rethrow;
    }
  }
}
