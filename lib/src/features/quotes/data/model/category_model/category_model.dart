import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  factory CategoryModel({
    int? id,
    @JsonKey(name: 'category_name') String? categoryName,
    String? slug,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  @override
  // TODO: implement categoryName
  String? get categoryName => throw UnimplementedError();

  @override
  // TODO: implement id
  int? get id => throw UnimplementedError();

  @override
  // TODO: implement slug
  String? get slug => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
