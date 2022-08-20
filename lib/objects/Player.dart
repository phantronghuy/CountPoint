import 'package:flutter/material.dart';

class Player {
  int? _id;
  String? _name;

  Player.Default(){}
  Player(id, name)
      : this._id = id,
        this._name = name {}
  getId() => _id;
  getName() => _name;
  setId(id) {
    this._id = id;
  }

  setName(name) {
    this._name = name;
  }
}
