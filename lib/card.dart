// class Card
// type -> character, weapon, room
// string -> path for file img
// img (if possible)
// string -> name of the card
// 

enum CardType {
  none,
  character,
  weapon,
  room
}

const cardTypeMap = {
  'none': CardType.none, 
  'character': CardType.character, 
  'weapon': CardType.weapon,
  'room': CardType.room
  };

const cardTypeMapTostr = {
  CardType.none: 'none',
  CardType.character: 'character',
  CardType.weapon: 'weapon',
  CardType.room: 'room'
};

// extends StatelessWidget (?)
class Card {
  CardType? cardType;
  String? img;
  String? name;

  Card({this.cardType, this.img, this.name});

  Card.fromJson(Map<String, dynamic> json) {
    cardType = cardTypeMap[json['cardType']];
    img = json['img'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cardType'] = cardTypeMapTostr[cardType];
    data['img'] = img;
    data['name'] = name;
    return data;
  }
}
