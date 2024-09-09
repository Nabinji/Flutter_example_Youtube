class Category {
  final String image, name;

  Category({required this.image, required this.name});
}

List<Category> categories = [
  Category(
    image: 'assets/complete-app/category/ramen.png',
    name: 'Ramen',
  ),
  Category(
    image: 'assets/complete-app/category/burger.png',
    name: 'Burger',
  ),
  Category(
    image: 'assets/complete-app/category/salad.png',
    name: 'Salad',
  ),
  Category(
    image: 'assets/complete-app/category/pancake.png',
    name: 'Waffle',
  ),
];
