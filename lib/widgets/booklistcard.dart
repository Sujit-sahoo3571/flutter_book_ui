import 'package:flutter/material.dart';

class BookListCard extends StatelessWidget {
  const BookListCard({
    super.key,
    required this.bookimage,
    required this.bookAuthor,
    required this.bookTitle,
    required this.bookCountry,
    required this.bookPages,
  });
  final String bookimage;
  final String bookAuthor;
  final String bookTitle;
  final String bookCountry;
  final int bookPages;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.asset(
            bookimage,
            height: 120.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Title: $bookTitle",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: "Lexend",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Author: $bookAuthor ",
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Country: $bookCountry ",
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "pages: $bookPages ",
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
