import 'package:flutter/material.dart';
import '../Model/blog_post_model.dart';
import 'post_detail_screen.dart';

class BlogHomePage extends StatelessWidget {
  const BlogHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Blogs For You',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://cdn4.sharechat.com/beautifulgirlprofilepicture_2fd82a95_1601311911497_cmprsd_40.jpg?tenant=sc&referrer=pwa-sharechat-service&f=rsd_40.jpg",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: const Icon(Icons.notifications_outlined,
                      color: Colors.grey),
                ),
                const Positioned(
                  top: 8,
                  right: 9,
                  child: CircleAvatar(radius: 5, backgroundColor: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: BottomAppBar(
          color: Colors.blue[50],
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBottomNavItem(Icons.home_filled, isSelected: true),
                _buildBottomNavItem(Icons.bookmark_outline),
                _buildBottomNavItem(Icons.favorite_outline),
                _buildBottomNavItem(Icons.person_outline),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        elevation: 0,
        onPressed: () {},
        child: const Icon(
          Icons.trending_up,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for articles, author, and tags',
                filled: true,
                fillColor: Colors.grey[200],
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Trending ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) =>
                                    PostDetailsPage(post: posts[index]),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 120,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.orange[100],
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      post.image,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      post.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${post.author}, ${post.date}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {},
      child: Icon(
        icon,
        size: 30,
        color: isSelected ? Colors.blue : Colors.black,
      ),
    );
  }
}
