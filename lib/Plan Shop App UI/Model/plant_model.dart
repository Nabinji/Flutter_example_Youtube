class Product {
  final String title;
  final String image;
  final String description;
  final double price;
  bool isFavorited;

  Product( {
    required this.description,
    required this.title,
    required this.image,
    required this.price,
    this.isFavorited = false,
  });
}


final List<Product> product = [
  Product(
    image: 'image/plant-image/2.png',
    title: 'Succulent Plant',
    price: 29.99,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  ),
  Product(
    image: 'image/plant-image/5.png',
    title: 'Dragon Plant',
    price: 25.99,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  ),
  Product(
    image: 'image/plant-image/6.png',
    title: 'Raevnea Plant',
    price: 22.99,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  ),
  Product(
    image: 'image/plant-image/1.png',
    title: 'Potted Plant',
    price: 24.99,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  ),
  Product(
    image: 'image/plant-image/4.png',
    title: 'Ipsum Plant',
    price: 50.99,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  ),
  Product(
    image: 'image/plant-image/3.png',
    title: 'AC Plant',
    price: 99.99,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  ),
];
