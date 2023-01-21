/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
import 'dart:ffi';

class CharacterList {
    String? charactername;
    String? img;

    CharacterList({this.charactername, this.img}); 

    CharacterList.fromJson(Map<String, dynamic> json) {
        charactername = json['character_name'];
        img = json['img'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['character_name'] = charactername;
        data['img'] = img;
        return data;
    }
}

class PlayerIn {
    String? username;
    String? character;

    PlayerIn({this.username, this.character}); 

    PlayerIn.fromJson(Map<String, dynamic> json) {
        username = json['username'];
        character = json['character'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['username'] = username;
        data['character'] = character;
        return data;
    }
}

class RequestNewgame {
    String? requesttype;
    String? gameid;
    List<PlayerIn?>? playerin;
    List<CharacterList?>? characterlist;
    bool? admin;

    RequestNewgame({this.requesttype, this.gameid, this.playerin, this.characterlist, this.admin}); 

    RequestNewgame.fromJson(Map<String, dynamic> json) {
        requesttype = json['request_type'];
        gameid = json['game_id'];
        if (json['player_in'] != null) {
         playerin = <PlayerIn>[];
         json['player_in'].forEach((v) {
         playerin!.add(PlayerIn.fromJson(v));
        });
        }
        if (json['character_list'] != null) {
         characterlist = <CharacterList>[];
         json['character_list'].forEach((v) {
         characterlist!.add(CharacterList.fromJson(v));
        });
        }
        admin = json['admin'] == 'true';
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['request_type'] = requesttype;
        data['game_id'] = gameid;
        data['player_in'] = playerin != null ? playerin!.map((v) => v?.toJson()).toList() : null;
        data['character_list'] = characterlist != null ? characterlist!.map((v) => v?.toJson()).toList() : null;
        data['admin'] = admin == true ? 'true' : 'false';

        return data;
    }
}

