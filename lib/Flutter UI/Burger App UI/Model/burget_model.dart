class Burger {
  final String name;
  final String image;
  final String distance;
  final double price;
  final double rating;
  final String description;
  bool isFavorited;

  Burger({
    required this.name,
    required this.image,
    required this.distance,
    required this.price,
    required this.rating,
    required this.description,
    this.isFavorited = false,
  });
}

final List<Burger> burgers = [
  Burger(
    name: "Extra Beef Burger",
    image:
        "https://static.vecteezy.com/system/resources/previews/023/522/928/non_2x/beef-burger-cutout-free-png.png",
    rating: 4.8,
    price: 990,
    distance: "5.3 km", 
    description: "A burger, short for hamburger, is a popular food item consisting of a cooked patty—typically made from ground beef—placed inside a sliced bread roll or bun. It often includes various toppings like lettuce, tomato, onions, pickles, cheese, and condiments such as ketchup, mustard, or mayonnaise.",
  ),
  Burger(
    name: "Smoked Beef burger",
    image:
        "https://static.vecteezy.com/system/resources/previews/023/522/925/non_2x/beef-burger-cutout-free-png.png",
    rating: 4.5,
    price: 222.0,
    distance: "990 km",  description:
        "A burger, short for hamburger, is a popular food item consisting of a cooked patty—typically made from ground beef—placed inside a sliced bread roll or bun. It often includes various toppings like lettuce, tomato, onions, pickles, cheese, and condiments such as ketchup, mustard, or mayonnaise.",
  ),
  Burger(
    name: "Grilled beef burger",
    image:
        "https://www.qualityassurancemag.com/fileuploads/publications/29/issues/103585/articles/images/Impossible_Burger_fmt.png",
    rating: 5.0,
    price: 130.0,
    distance: "4.3 km",
     description:
        "A burger, short for hamburger, is a popular food item consisting of a cooked patty—typically made from ground beef—placed inside a sliced bread roll or bun. It often includes various toppings like lettuce, tomato, onions, pickles, cheese, and condiments such as ketchup, mustard, or mayonnaise.",
  ),
  Burger(
    name: "Fried chicken burger",
    image:
        "https://static.vecteezy.com/system/resources/previews/032/325/430/non_2x/fried-chicken-burger-isolated-on-transparent-background-file-cut-out-ai-generated-png.png",
    rating: 5.0,
    price: 120.0,
    distance: "1.3 km",
     description:
        "A burger, short for hamburger, is a popular food item consisting of a cooked patty—typically made from ground beef—placed inside a sliced bread roll or bun. It often includes various toppings like lettuce, tomato, onions, pickles, cheese, and condiments such as ketchup, mustard, or mayonnaise.",
  ),
];
List<String> categoryList = [
  '🍖Beef',
  '🧀Cheese',
  '🍤Shrimp',
  '🍕Pizza',
];
