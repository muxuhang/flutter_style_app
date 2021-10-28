import 'package:json_annotation/json_annotation.dart';


part 'artistList.g.dart';
@JsonSerializable()
class ArtistList {
    ArtistList();

    late List artists;
    late bool more;
    late num code;
    
    factory ArtistList.fromJson(Map<String,dynamic> json) => _$ArtistListFromJson(json);
    Map<String, dynamic> toJson() => _$ArtistListToJson(this);
}