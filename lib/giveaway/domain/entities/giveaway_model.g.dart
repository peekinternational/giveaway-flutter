// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giveaway_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GiveawayModel _$$_GiveawayModelFromJson(Map<String, dynamic> json) =>
    _$_GiveawayModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      worth: json['worth'] as String?,
      thumbnail: json['thumbnail'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      instructions: json['instructions'] as String?,
      open_giveaway_url: json['open_giveaway_url'] as String?,
      published_date: json['published_date'] as String?,
      type: json['type'] as String?,
      platforms: json['platforms'] as String?,
      end_date: json['end_date'] as String?,
      users: json['users'] as int?,
      status: json['status'] as String?,
      gamerpower_url: json['gamerpower_url'] as String?,
      open_giveaway: json['open_giveaway'] as String?,
    );

Map<String, dynamic> _$$_GiveawayModelToJson(_$_GiveawayModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'worth': instance.worth,
      'thumbnail': instance.thumbnail,
      'image': instance.image,
      'description': instance.description,
      'instructions': instance.instructions,
      'open_giveaway_url': instance.open_giveaway_url,
      'published_date': instance.published_date,
      'type': instance.type,
      'platforms': instance.platforms,
      'end_date': instance.end_date,
      'users': instance.users,
      'status': instance.status,
      'gamerpower_url': instance.gamerpower_url,
      'open_giveaway': instance.open_giveaway,
    };
