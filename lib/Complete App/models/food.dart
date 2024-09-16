// for categories model

const catgories = [
  "All",
  "Breakfast",
  "Lunch",
  "Dinner",
];

// for itemsmodel
class Food {
  String name;
  String category;
  String image;
  double cal;
  double time;
  double rate;
  int reviews;
  bool isLiked;

  Food(
      {required this.name,
      required this.image,
      required this.cal,
      required this.time,
      required this.rate,
      required this.reviews,
      required this.isLiked,
      required this.category});
}

final List<Food> foods = [
  Food(
    name: "Spicy Ramen Noodles",
    image: "assets/images1/ramen-noodles.jpg",
    cal: 120,
    time: 15,
    rate: 4.4,
    reviews: 23,
    category: "Breakfast",
    isLiked: false,
  ),
  Food(
    name: "Beef Steak",
    image: "assets/images1/beaf-steak.jpg",
    cal: 140,
    time: 25,
    category: "Lunch",
    rate: 4.4,
    reviews: 23,
    isLiked: true,
  ),
  Food(
    name: "Butter Chicken",
    image: "assets/images1/butter-chicken.jpg",
    cal: 130,
    time: 18,
    rate: 4.2,
    category: "Dinner",
    reviews: 10,
    isLiked: false,
  ),
  Food(
    name: "French Toast",
    image: "assets/images1/french-toast.jpg",
    cal: 110,
    time: 16,
    category: "Lunch",
    rate: 4.6,
    reviews: 90,
    isLiked: true,
  ),
  Food(
    name: "Dumplings",
    image: "assets/images1/dumplings.jpg",
    cal: 150,
    time: 30,
    category: "Lunch",
    rate: 4.0,
    reviews: 76,
    isLiked: false,
  ),
  Food(
    name: "Mexican Pizza",
    image: "assets/images1/mexican-pizza.jpg",
    cal: 140,
    time: 25,
    rate: 4.4,
    category: "Breakfast",
    reviews: 23,
    isLiked: false,
  ),
];
