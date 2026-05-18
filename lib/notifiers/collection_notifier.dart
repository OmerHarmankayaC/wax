import 'package:flutter/material.dart';
import '../models/album.dart';

class CollectionNotifier extends ChangeNotifier {
  final List<Album> _collection = [];

  List<Album> get collection => List.unmodifiable(_collection);

  bool contains(int albumId) => _collection.any((a) => a.id == albumId);

  void add(Album album) {
    if (!contains(album.id)) {
      _collection.add(album);
      notifyListeners();
    }
  }

  void remove(int albumId) {
    _collection.removeWhere((a) => a.id == albumId);
    notifyListeners();
  }
}
