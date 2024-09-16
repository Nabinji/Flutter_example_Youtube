import 'package:flutter/material.dart';
import 'models/book.dart';
import 'details.dart';

class BooksHome extends StatelessWidget {
  const BooksHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.book,
                  size: 35,
                  color: Colors.black,
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    "BooksApp",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: booklist.length,
                    itemBuilder: (context, index) {
                      final book = booklist[index];
                      return book.seller
                          ? ShowCase(book: book)
                          : const SizedBox.shrink();
                    },
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "BEST SELLERS",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const Divider(color: Colors.black54),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "New Book List",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 325,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: booklist.length,
                    itemBuilder: (context, index) {
                      final book = booklist[index];
                      return ShowBooks(book: book);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShowCase extends StatelessWidget {
  final Book book;
  const ShowCase({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return bestSellersBook(context);
  }

  GestureDetector bestSellersBook(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Details(book),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            book.showImage,
            height: 250,
            width: 350,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ShowBooks extends StatelessWidget {
  final Book book;
  const ShowBooks({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final String title = book.title.length > 15
        ? "${book.title.substring(0, 13)}..."
        : book.title;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Details(book),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                book.cover,
                height: 220,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              book.author,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black45,
              ),
            ),
            Text(
              "\$${book.price}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
