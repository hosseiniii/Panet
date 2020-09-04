import 'dart:core';

class Bread {
  String _image;
  int _price;
  String _name;
  int _id;


  Bread(this._image, this._price, this._name);


  Bread.update(this._id, this._name, this._price);

  Bread.map(dynamic obj) {
    this._name = obj['name'];
    this._price = obj['price'];
    this._image = obj['image'];
    this._id = obj['id'];
  }

  Bread.fromMap(Map map) {
    this._name = map['name'];
    this._image = map['image'];
    this._id = map['id'];
    this._price = map['price'];
  }

    Map<String, dynamic> toMap() => {
      "id": this._id,
      "name": this._name,
      "price": this._price,
      "image": this._image,
    };

  int get id => _id;

  String get name => _name;

  int get price => _price;

  String get image => _image;

  set id(int value) {
    _id = value;
  }

  set name(String value) {
    _name = value;
  }

  set price(int value) {
    _price = value;
  }

  set image(String value) {
    _image = value;
  }


}