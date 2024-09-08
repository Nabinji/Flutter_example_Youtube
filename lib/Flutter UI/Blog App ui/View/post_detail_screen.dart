import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Blog%20App%20ui/Model/blog_post_model.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;
  const PostDetailsPage({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          shareFavoriteIcon(Icons.bookmark_outline),
          shareFavoriteIcon(Icons.favorite_outline),
          shareFavoriteIcon(Icons.share_outlined),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
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
                    radius: 16,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/premium-photo/profile-picture-happy-young-caucasian-man-spectacles-show-confidence-leadership-headshot-portrait-smiling-millennial-male-glasses-posing-indoors-home-employment-success-concept_774935-1446.jpg'),
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
                spacing: 16,
                children: [
                  viewsLikesAndMethod(
                      Icons.remove_red_eye_outlined, "${post.views} Views"),
                  viewsLikesAndMethod(Icons.favorite, "${post.likes} Like"),
                  viewsLikesAndMethod(Icons.bookmark, "${post.saves} Save"),
                ],
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  post.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'A ',
                      style: GoogleFonts.notoSerif(
                        color: Colors.black,
                        fontSize: 32,
                      ),
                    ),
                    TextSpan(
                      text:
                          post.description,
                      style: GoogleFonts.notoSerif(
                        color: Colors.black,
                        fontSize: 18,
                        height: 1.7,
                        wordSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Wrap viewsLikesAndMethod(icon, title) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 4,
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.black54,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }

  Padding shareFavoriteIcon(icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.grey[200],
          child: IconButton(
            icon: Icon(
              icon,
              size: 25,
              color: Colors.black,
            ),
            color: Colors.grey,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
