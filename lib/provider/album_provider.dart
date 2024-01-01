import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider_ex02/model/album.dart';
import 'package:http/http.dart' as http;

class AlbumProvider with ChangeNotifier {
  final List<Album> _albumList = List.empty(growable: true);

  List<Album> getAlbumList() {
    _fetchAlbums();
    return _albumList;
  }

  void _fetchAlbums() async {
    final resp = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final List<Album> result = jsonDecode(resp.body)
        .map<Album>((json) => Album.fromJson(json))
        .toList();

    _albumList.clear();
    _albumList.addAll(result);
    notifyListeners();
  }
}
