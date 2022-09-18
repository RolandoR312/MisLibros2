import 'package:flutter/material.dart';
import 'package:mis_libros/models/result.dart';
import 'package:mis_libros/pages/detail_search_book_page.dart';
import 'package:mis_libros/repository/books_api.dart';

class SearchBookPage extends StatefulWidget {
  const SearchBookPage({Key? key}) : super(key: key);

  @override
  State<SearchBookPage> createState() => _SearchBookPageState();
}

class _SearchBookPageState extends State<SearchBookPage> {
  BooksApi _booksApi = BooksApi();

  final _parametro = TextEditingController();

  List<Items> listBooks = <Items>[];

  Future _searchBook() async {
    Result resultFuture = await _booksApi.getBooks(_parametro.text);
    setState(() {
      resultFuture.items?.forEach((element) {
        listBooks.add(element);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(children: [
            TextFormField(
              controller: _parametro,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite libro o autor"),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _searchBook();
              },
              child: const Text('Buscar Libro'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listBooks.length,
                itemBuilder: (BuildContext context, int index) {
                  Items book = listBooks[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        book.volumeInfo?.imageLinks?.smallThumbnail ?? "",
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Image(
                            image: AssetImage('assets/images/logo.png'),
                          );
                        },
                      ),
                      title: Text(book.volumeInfo?.title ?? "No title"),
                      subtitle: Text(
                          book.volumeInfo?.publishedDate ?? "No publishedDate"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailSearchBookPage(book)));
                      },
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
