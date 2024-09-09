import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Blog%20App%20ui/Model/blog_post_model.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  const PostDetail({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          myIconButton(Icons.bookmark_outline),
          myIconButton(Icons.favorite_border),
          myIconButton(Icons.share_outlined),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
        child: ListView(
          children: [
            Text(
              post.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 17,
                  backgroundImage: NetworkImage(
                      "https://img.freepik.com/premium-photo/profile-picture-happy-young-caucasian-man-spectacles-show-confidence-leadership-headshot-portrait-smiling-millennial-male-glasses-posing-indoors-home-employment-success-concept_774935-1446.jpg"),
                ),
                const SizedBox(width: 8),
                Text("${post.author}, "),
                Text(
                  post.date,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: [
                likeShareButton(
                    Icons.remove_red_eye_outlined, "${post.views} View"),
                likeShareButton(Icons.favorite, "${post.likes} Like"),
                likeShareButton(Icons.bookmark, "${post.saves} Save"),
              ],
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(post.image, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  text: "A ",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                  ),
                  children: [
                    TextSpan(
                      text: post.description,
                      style: const TextStyle(
                        fontSize: 20,
                        wordSpacing: 2,
                        height: 1.5,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Wrap likeShareButton(icon, title) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 5,
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.black54,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black54,
          ),
        )
      ],
    );
  }

  Padding myIconButton(icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.grey[200],
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
