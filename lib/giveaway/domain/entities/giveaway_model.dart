import 'package:freezed_annotation/freezed_annotation.dart';


part 'giveaway_model.freezed.dart';
part 'giveaway_model.g.dart';

@freezed
class GiveawayModel with _$GiveawayModel {
factory GiveawayModel(
    {
      int? id,
      String? title,
      String? worth,
      String? thumbnail,
      String? image,
      String? description,
      String? instructions,
      String? openGiveawayUrl,
      String? publishedDate,
      String? type,
      String? platforms,
      String? endDate,
      int? users,
      String? status,
      String? gamerpowerUrl,
      String? openGiveaway,
    }) = _GiveawayModel;
 factory GiveawayModel.fromJson(Map<String, dynamic> json) => _$GiveawayModelFromJson(json);
}


