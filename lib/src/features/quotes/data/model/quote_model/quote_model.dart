import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_model.freezed.dart';
part 'quote_model.g.dart';

@freezed
class QuoteModel with _$QuoteModel {
  factory QuoteModel({
    int? id,
    @JsonKey(name: 'category_id') int? categoryId,
    String? word,
  }) = _QuoteModel;

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);

  @override
  // TODO: implement categoryId
  int? get categoryId => throw UnimplementedError();

  @override
  // TODO: implement id
  int? get id => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement word
  String? get word => throw UnimplementedError();
}
