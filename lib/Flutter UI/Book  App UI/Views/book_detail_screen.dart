import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Book%20%20App%20UI/models/book.dart';
import 'package:flutter_rating/flutter_rating.dart';

bool isCart = true;
bool isFavorite = true;

class BookDetailScreen extends StatefulWidget {
  final Book book;
  const BookDetailScreen({super.key, required this.book});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  String cartText = "Add to cart";
  @override
  void initState() {
    isCart = false;
    isFavorite = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: headerParts(context),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: widget.book.cover,
                      child: Image.network(
                        widget.book.cover,
                        fit: BoxFit.fill,
                        height: 260,
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            widget.book.title,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54,
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
                                widget.book.authorImg,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.book.author,
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
                          children: [
                            StarRating(
                              rating: widget.book.rating,
                              size: 20,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.book.rating.toString(),
                              style: const TextStyle(
                                color: Colors.black38,
                                fontSize: 15,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 110,
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      moviMoreInfo(
                        "https://cdn.vectorstock.com/i/thumb-large/93/62/psychology-icon-vector-15909362.jpg",
                        widget.book.genre,
                        "Genera",
                      ),
                      const SizedBox(width: 10),
                      moviMoreInfo(
                        "https://cdn2.iconfinder.com/data/icons/translation-1/513/translation-translate-language-international-translating_2_copy_7-512.png",
                        widget.book.lanugage,
                        "Language",
                      ),
                      const SizedBox(width: 10),
                      moviMoreInfo(
                        "https://cdn-icons-png.flaticon.com/512/4994/4994482.png",
                        widget.book.age,
                        "Age",
                      )
                    ],
                  ),
                ),
              ),
              infoAndReview()
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {},
        label: Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "\$${widget.book.price}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: "\$${widget.book.price + 4.5}",
                    style: const TextStyle(
                        color: Colors.black38,
                        fontSize: 15,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                backgroundColor: isCart ? Colors.red : Colors.black54,
              ),
              onPressed: () {
                setState(() {
                  isCart = !isCart;
                  cartText =
                      (isCart == false) ? "Add to cart" : "Remove from cart";
                });
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    cartText,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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

  SizedBox infoAndReview() {
    return SizedBox(
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
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  const TabBar(
                    labelPadding: EdgeInsets.only(
                      bottom: 13,
                    ),
                    indicatorColor: Colors.black,
                    unselectedLabelColor: Colors.black38,
                    tabs: [
                      Text("Info"),
                      Text("Reviews"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    const Text(
                      "Summary",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.3,
                        height: 2,
                      ),
                    ),
                    Text(
                      widget.book.summary,
                      style: const TextStyle(fontSize: 17),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text(
                  "No Reviews Available",
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
    );
  }

  Container moviMoreInfo(image, title, value) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2, color: Colors.black12),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: Row(
        children: [
          Image.network(
            image,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 15),
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  PreferredSize headerParts(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
        actions: [
          const Icon(
            Icons.file_upload,
            color: Colors.black,
            size: 25,
          ),
          const SizedBox(width: 25),
          GestureDetector(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.black,
              size: 25,
            ),
          ),
          const SizedBox(width: 25),
        ],
      ),
    );
  }
}
