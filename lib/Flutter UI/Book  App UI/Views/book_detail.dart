import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import '../models/book.dart';

bool inCart = false;
bool isFav = false;

class BooksDetailsScreen extends StatefulWidget {
  final Book bookObject;

  const BooksDetailsScreen(this.bookObject, {super.key});

  @override
  _BooksDetailsScreenState createState() => _BooksDetailsScreenState();
}

class _BooksDetailsScreenState extends State<BooksDetailsScreen> {
  String _buttonText = "Add to cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
              size: 25,
            ),
          ),
          actions: [
            const Icon(
              Icons.file_upload,
              color: Colors.black87,
              size: 25,
            ),
            const SizedBox(width: 25),
            GestureDetector(
              onTap: () {
                setState(() {
                  isFav = !isFav;
                });
              },
              child: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : Colors.black87,
                size: 25,
              ),
            ),
            const SizedBox(width: 25),
          ],
        ),
      ),
      body: BooksDetailsScreenPageBody(widget.bookObject),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {},
        label: Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "\$${widget.bookObject.price} ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: "\$${widget.bookObject.price + 5.55}",
                    style: const TextStyle(
                      color: Colors.black26,
                      fontSize: 15,
                      decoration: TextDecoration.lineThrough,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 10,
                ),
                backgroundColor: inCart ? Colors.red : Colors.black54,
              ),
              onPressed: () {
                setState(() {
                  inCart = !inCart;
                  _buttonText =
                      (inCart == false) ? "Add to cart" : "Remove from cart";
                });
              },
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    _buttonText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BooksDetailsScreenPageBody extends StatefulWidget {
  final Book bookObject;

  const BooksDetailsScreenPageBody(this.bookObject, {super.key});

  @override
  _BooksDetailsScreenPageBodyState createState() => _BooksDetailsScreenPageBodyState();
}

class _BooksDetailsScreenPageBodyState extends State<BooksDetailsScreenPageBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    widget.bookObject.cover,
                    fit: BoxFit.fill,
                    height: 260,
                    width: MediaQuery.of(context).size.width / 2.5,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          widget.bookObject.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black54,
                            fontSize: 25,
                          ),
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                              widget.bookObject.authorImg,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            widget.bookObject.author,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          StarRating(
                            rating: widget.bookObject.rating,
                            size: 20,
                            color: Colors.yellow.shade700,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.bookObject.rating.toString(),
                            style: const TextStyle(
                              color: Colors.black38,
                              fontSize: 15,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 110,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    CategoryBox(
                      category: "GENRE",
                      categoryValue: widget.bookObject.genre,
                      categoryIcon:
                          "https://cdn3.vectorstock.com/i/thumb-large/93/62/psychology-icon-vector-15909362.jpg",
                    ),
                    const SizedBox(width: 10),
                    CategoryBox(
                      category: "LANGUAGE",
                      categoryValue: widget.bookObject.lanugage,
                      categoryIcon:
                          "https://cdn2.iconfinder.com/data/icons/translation-1/513/translation-translate-language-international-translating_2_copy_7-512.png",
                    ),
                    const SizedBox(width: 10),
                    CategoryBox(
                      category: "AGE",
                      categoryValue: widget.bookObject.age,
                      categoryIcon:
                          "https://cdn-icons-png.flaticon.com/512/4994/4994482.png",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 400,
              width: double.infinity,
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                    child: SafeArea(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(),
                          ),
                          const TabBar(
                            labelPadding: EdgeInsets.only(
                              bottom: 13,
                            ),
                            indicatorColor: Colors.black,
                            unselectedLabelColor: Colors.black38,
                            tabs: <Widget>[
                              Text("Info"),
                              Text("Reviews"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  body: TabBarView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ListView(
                          children: <Widget>[
                            const Text(
                              "Plot Summary",
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.3,
                                  height: 2),
                            ),
                            Text(
                              widget.bookObject.summary,
                              softWrap: true,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Center(
                        child: Text(
                          "NO REVIEWS",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Colors.black54,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CategoryBox extends StatelessWidget {
  final String category;
  final String categoryValue;
  final String categoryIcon;

  const CategoryBox({
    super.key,
    required this.category,
    required this.categoryValue,
    required this.categoryIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black12,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: Row(
        children: <Widget>[
          Image.network(
            categoryIcon,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                category,
                style: const TextStyle(
                  letterSpacing: 1.5,
                  color: Colors.black38,
                  fontSize: 12,
                ),
              ),
              Text(
                categoryValue,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
