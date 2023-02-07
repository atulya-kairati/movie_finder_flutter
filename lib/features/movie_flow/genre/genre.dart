import 'package:flutter/cupertino.dart';

@immutable
class Genre {
  final int id;
  final String name;
  final bool isSelected;

  const Genre({
    this.id = 0,
    required this.name,
    this.isSelected = false,
  });

  Genre toggleSelected() {
    return Genre(id: id, name: name, isSelected: !isSelected);
  }

  @override
  String toString() {
    return "Genre[id: $id, name: $name, isSelected: $isSelected]";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Genre &&
        id == other.id &&
        name == other.name &&
        isSelected == other.isSelected;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode ^ isSelected.hashCode;
}
