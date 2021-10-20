// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artistList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistList _$ArtistListFromJson(Map<String, dynamic> json) {
  return ArtistList()
    ..artists = json['artists'] as List
    ..more = json['more'] as bool
    ..code = json['code'] as num;
}

Map<String, dynamic> _$ArtistListToJson(ArtistList instance) =>
    <String, dynamic>{
      'artists': instance.artists,
      'more': instance.more,
      'code': instance.code,
    };
