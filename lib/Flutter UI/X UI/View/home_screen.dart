import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numeral/numeral.dart';
import '../constants.dart';
import '../models/tweet.dart';

class XHomeScreen extends StatefulWidget {
  const XHomeScreen({super.key});

  @override
  State<XHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<XHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Image.network(
            "https://logos-world.net/wp-content/uploads/2023/08/X-Logo.png",
            color: Colors.white,
            width: 40,
            height: 40,
          ),
          centerTitle: true,
          leading: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://images.top10.com/f_auto,q_auto/v1/production/articles/uploads/photo/Untitleddesign403.20220526114538.jpg"),
            ),
          ),
          bottom: const TabBar(
            unselectedLabelColor: kcontentColor,
            indicatorColor: kprimaryColor,
            labelStyle: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            labelColor: Colors.white,
            tabs: [
              Tab(text: "For you"),
              Tab(text: "Following"),
              Tab(text: "Subscribed"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                      color: kcontentColor,
                      thickness: 0.1,
                    ),
                itemCount: tweets.length,
                itemBuilder: (context, index) {
                  final tweet = tweets[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            tweet.image,
                          ),
                        ),
                        const SizedBox(width: 7),
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    tweet.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  SvgPicture.asset(
                                    "assets/icons/twitter-verified.svg",
                                    color: kprimaryColor,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "@${tweet.username} - ${tweet.time}",
                                    style: const TextStyle(
                                      color: kcontentColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                tweet.tweet,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              tweet.tweetImage != ""
                                  ? Container(
                                      height: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage(tweet.tweetImage),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    )
                                  : Container(),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/twitter-reply-outline.svg",
                                    color: kcontentColor,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    tweet.comments.numeral(),
                                    style: const TextStyle(
                                      color: kcontentColor,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SvgPicture.asset(
                                    "assets/icons/twitter-retweet.svg",
                                    color: kcontentColor,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    tweet.shares.numeral(),
                                    style: const TextStyle(
                                      color: kcontentColor,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SvgPicture.asset(
                                    "assets/icons/twitter-like-outline.svg",
                                    color: kcontentColor,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    tweet.likes.numeral(),
                                    style: const TextStyle(
                                      color: kcontentColor,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SvgPicture.asset(
                                    "assets/icons/twitter-analytics.svg",
                                    color: kcontentColor,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    tweet.views.numeral(),
                                    style: const TextStyle(
                                      color: kcontentColor,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_horiz),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.file_upload_outlined),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
