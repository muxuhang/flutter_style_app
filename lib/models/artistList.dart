import 'package:json_annotation/json_annotation.dart';


part 'artistList.g.dart';
@JsonSerializable()
class ArtistList {
    ArtistList();

    List artists;
    bool more;
    num code;
    
    factory ArtistList.fromJson(Map<String,dynamic> json) => _$ArtistListFromJson(json);
    Map<String, dynamic> toJson() => _$ArtistListToJson(this);
}