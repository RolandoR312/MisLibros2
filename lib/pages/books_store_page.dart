import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'detail_store_page.dart';

class BooksStorePage extends StatefulWidget {
  const BooksStorePage({Key? key}) : super(key: key);

  @override
  State<BooksStorePage> createState() => _BooksStorePageState();
}

class _BooksStorePageState extends State<BooksStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("stores").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading');
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot store = snapshot.data!.docs[index];
                  return Card(
                      child: ListTile(
                    leading: Image.network(
                      store['urlPicture'] ?? "",
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Image(
                          image: AssetImage('assets/images/logo.png'),
                        );
                      },
                    ),
                    title: Text(store['name']),
                    subtitle: Text(store['address']),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailStorePage(store)));
                    },
                  ));
                },
              );
            },
          )),
    );
  }
}
