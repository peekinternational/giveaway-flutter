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
      String? open_giveaway_url,
      String? published_date,
      String? type,
      String? platforms,
      String? end_date,
      int? users,
      String? status,
      String? gamerpower_url,
      String? open_giveaway,
    }) = _GiveawayModel;
 factory GiveawayModel.fromJson(Map<String, dynamic> json) => _$GiveawayModelFromJson(json);
}


