import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mis_libros/models/local_book.dart';

import '../boxes.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: _buildListView(),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ValueListenableBuilder<Box<LocalBook>>(
        valueListenable: Boxes.getFavoritesBox().listenable(),
        builder: (context, box, _) {
          final bookBox = box.values.toList().cast<LocalBook>();
          return ListView.builder(
            itemCount: bookBox.length,
            itemBuilder: (BuildContext context, int index) {
              final book = bookBox[index];
              return Card(
                child: ListTile(
                  leading: Image.network(
                    book.imageLink ?? "",
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Image(
                        image: AssetImage('assets/images/logo.png'),
                      );
                    },
                  ),
                  title: Text(book.name ?? "No title"),
                  subtitle: Text(book.publishedDate ?? "No publishedDate"),
                  onLongPress: () {
                    setState(() {
                      book.delete();
                    });
                  },
                ),
              );
            },
          );
        });
  }
}
