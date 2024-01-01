import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex02/model/album.dart';
import 'package:provider_ex02/provider/album_provider.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({super.key});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  late List<Album> albumList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Album list')),
      body: Consumer<AlbumProvider>(builder: (context, provider, child) {
        albumList = provider.getAlbumList();
        return ListView.builder(
            itemCount: albumList.length,
            itemBuilder: (context, i) {
              return Container(
                padding: const EdgeInsets.all(15),
                child: Text('${albumList[i].id}: ${albumList[i].title}'),
              );
            });
      }),
    );
  }
}
