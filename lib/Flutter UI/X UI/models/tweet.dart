class Tweet {
  String image;
  String tweetImage;
  String name;
  String username;
  String tweet;
  int comments;
  int shares;
  int likes;
  int views;
  String time;

  Tweet({
    required this.image,
    required this.name,
    required this.username,
    required this.tweet,
    required this.comments,
    required this.shares,
    required this.likes,
    required this.tweetImage,
    required this.views,
    required this.time,
  });
}

final List<Tweet> tweets = [
  Tweet(
    name: "Dieter Rams",
    username: "di_rams",
    tweet: "Pretty ❤️",
    comments: 60,
    shares: 50,
    likes:100,
    views: 1100,
    time: "10m",
    tweetImage: "https://marketplace.canva.com/EAFOWUXOOvs/1/0/1600w/canva-green-gradient-minimalist-simple-instagram-profile-picture-tBlf3wVYGhg.jpg",
    image:
        "https://marketplace.canva.com/EAFOWUXOOvs/1/0/1600w/canva-green-gradient-minimalist-simple-instagram-profile-picture-tBlf3wVYGhg.jpg",
  ),
  Tweet(
    name: "Paul Rand",
    username: "cd_paul",
    tweet:
        "Success isn’t just about what you accomplish in your life; it’s about what you inspire others to do. True success lies not in the destination, but in the journey, and in how you uplift those who walk it with you.",
    comments: 2000,
    shares: 500,
    likes: 10000,
    views: 5000000,
    tweetImage: "",
    time: "1h",
    image:
        "https://wallpapers.com/images/featured/women-profile-pictures-8vxjyailtsus6skr.jpg",
  ),
  Tweet(
    name: "Massimo Vignelli",
    username: "massi_vi",
    tweet:
        "The path to greatness is not paved with comfort and ease but with perseverance, resilience, and the willingness to push beyond the limits of what is known.",
    comments: 520,
    shares: 500,
    likes: 1000,
    views: 300000,
    tweetImage: "https://quotefancy.com/media/wallpaper/3840x2160/353377-Baltasar-Graci-n-Quote-The-path-to-greatness-is-along-with-others.jpg",
    time: "5h",
    image:
        "https://www.shutterstock.com/image-photo/headshot-portrait-smiling-african-american-600nw-1667439898.jpg",
  ),
  Tweet(
    name: "Jonathan Ive",
    username: "ive_jon",
    tweet:
        "In the face of challenges, remember that growth is often uncomfortable, but necessary. It’s in those moments of discomfort that you are being stretched beyond your current limits, preparing you for the incredible opportunities that lie ahead.",
    comments: 526,
    shares: 300,
    likes: 6500,
    views: 900000,
    tweetImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtX_GjcfM0-b1C8hfNB-vpRK-kkrOvxPHErw&s",
    time: "10m",
    image:
        "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
  ),
  Tweet(
    name: "Dennis Ritchie",
    username: "dennis_ri",
    tweet:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    comments: 444,
    shares: 1111,
    likes: 66666,
    tweetImage: "",
    views: 8888888,
    time: "1h",
    image:
        "https://marketplace.canva.com/EAFOWUXOOvs/1/0/1600w/canva-green-gradient-minimalist-simple-instagram-profile-picture-tBlf3wVYGhg.jpg",
  ),
  Tweet(
    name: "Linus Torvalds",
    username: "linus-a",
    tweet: "Dream big. Start small. Act now.",
    comments: 2000,
    shares: 500,
    likes: 10000,
    tweetImage: "",
    views: 5000000,
    time: "3h",
    image:
        "https://wallpapers.com/images/featured/women-profile-pictures-8vxjyailtsus6skr.jpg",
  ),
  Tweet(
    name: "Guido van Rossum",
    username: "cd_doge",
    tweet:
        "In the face of challenges, remember that growth is often uncomfortable, but necessary. It’s in those moments of discomfort that you are being stretched beyond your current limits, preparing you for the incredible opportunities that lie ahead.",
    comments: 2520,
    shares: 600,
    likes: 120000,
    tweetImage: "",
    views: 9000000,
    time: "5h",
    image:
        "https://www.shutterstock.com/image-photo/headshot-portrait-smiling-african-american-600nw-1667439898.jpg",
  ),
  Tweet(
    name: "Bjarne Stroustrup",
    username: "bj-trup",
    tweet:
        "The path to greatness is not paved with comfort and ease but with perseverance, resilience, and the willingness to push beyond the limits of what is known. ",
    comments: 620,
    shares: 360,
    likes: 9590,
    tweetImage: "https://wallpapers.com/images/featured/women-profile-pictures-8vxjyailtsus6skr.jpg",
    views: 50000,
    time: "30m",
    image:
        "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
  ),
];
