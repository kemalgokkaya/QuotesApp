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
}
