class CollectionModel {
  final String name, price, imagePath;
  final List<CollectionDetailsModel> collectionProducts;
  CollectionModel({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.collectionProducts,
  });
}
// it is the sample model data all the code is in description you can yous code from there
class CollectionDetailsModel {
  final String name, price, description, imagePath;
  CollectionDetailsModel({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });
}

List<CollectionModel> mockData = [
  CollectionModel(
    name: "Youve Collection",
    price: "350",
    imagePath: "assets/furniture-image/22.jpg",
    collectionProducts: [
      CollectionDetailsModel(
        name: "Vegan-Leather Chair",
        price: "75",
        description:
            "Vegan leather chair with a premium finish.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at malesuada nisi, non ultrices nunc. Sed eu eros est. Sed pharetra mollis rhoncus.",
        imagePath: "assets/furniture-image/13.jpg",
      ),
      CollectionDetailsModel(
        name: "Yellow-Chair Set",
        price: "299",
        description:
            "Set of 3 chairs.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at malesuada nisi, non ultrices nunc. Sed eu eros est. Sed pharetra mollis rhoncus.",
        imagePath: "assets/furniture-image/5.jpg",
      ),
      CollectionDetailsModel(
        name: "Wooden Ladder",
        price: "59.99",
        description:
            "Wooden ladder with a premium finish.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at malesuada nisi, non ultrices nunc. Sed eu eros est. Sed pharetra mollis rhoncus.",
        imagePath: "assets/furniture-image/10.jpg",
      ),
    ],
  ),
  CollectionModel(
    name: "Scarlet Collection",
    price: "180",
    imagePath: "assets/furniture-image/0.jpg",
    collectionProducts: [
      CollectionDetailsModel(
        name: "Modern Chair",
        price: "320",
        description:
            "The 2021 collection conjures the spirit of a contemporary habitat where the interior decor is also reflected in the outdoor spaces and embodies an all-encompassing",
        imagePath: "assets/furniture-image/5.jpg",
      ),
      CollectionDetailsModel(
        name: "Lamps Chair",
        price: "99",
        description:
            "The 2021 collection conjures the spirit of a contemporary habitat where the interior decor is also reflected in the outdoor spaces and embodies an all-encompassing",
        imagePath: "assets/furniture-image/6.jpg",
      ),
      CollectionDetailsModel(
        name: "White Chair",
        price: "129",
        description:
            "The 2021 collection conjures the spirit of a contemporary habitat where the interior decor is also reflected in the outdoor spaces and embodies an all-encompassing",
        imagePath: "assets/furniture-image/7.jpg",
      ),
    ],
  ),
  CollectionModel(
      name: "Lindsi Collection",
      price: "300",
      imagePath: "assets/furniture-image/1.jpg",
      collectionProducts: [
        CollectionDetailsModel(
          name: "Wooden Chair",
          price: "179",
          description:
              "Vegan Green Leather Armrest with wooden carvings.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at malesuada nisi, non ultrices nunc. Sed eu eros est. Sed pharetra mollis rhoncus.",
          imagePath: "assets/furniture-image/8.jpg",
        ),
        CollectionDetailsModel(
          name: "Black-&-white Set",
          price: "89",
          description:
              "Black and white set with a touch of gold.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at malesuada nisi, non ultrices nunc. Sed eu eros est. Sed pharetra mollis rhoncus.",
          imagePath: "assets/furniture-image/9.jpg",
        ),
        CollectionDetailsModel(
          name: "Wooden Ladder",
          price: "339",
          description:
              "2 Tier Wooden Ladder.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at malesuada nisi, non ultrices nunc. Sed eu eros est. Sed pharetra mollis rhoncus.",
          imagePath: "assets/furniture-image/10.jpg",
        ),
      ]),
  CollectionModel(
      name: "Batra Collection",
      price: "999",
      imagePath: "assets/furniture-image/2.jpg",
      collectionProducts: [
        CollectionDetailsModel(
          name: "Leather-Woven Chair",
          price: "499",
          description:
              "Vegan Leather chair with woven backrest.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at malesuada nisi, non ultrices nunc. Sed eu eros est. Sed pharetra mollis rhoncus.",
          imagePath: "assets/furniture-image/11.jpg",
        ),
        CollectionDetailsModel(
          name: "Table-&-Chair Set",
          price: "949",
          description:
              "Premium Monochromatic Table & Chair Set.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at malesuada nisi, non ultrices nunc. Sed eu eros est. Sed pharetra mollis rhoncus.",
          imagePath: "assets/furniture-image/12.jpg",
        ),
        CollectionDetailsModel(
          name: "Black Chair",
          price: "199",
          description:
              "Black Chair with a premium finish.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at malesuada nisi, non ultrices nunc. Sed eu eros est. Sed pharetra mollis rhoncus.",
          imagePath: "assets/furniture-image/13.jpg",
        ),
      ]),
  CollectionModel(
    name: "Sattire Collection",
    price: "380",
    imagePath: "assets/furniture-image/7.jpg",
    collectionProducts: [
      CollectionDetailsModel(
        name: "Green-Sofa Set",
        price: "359",
        description: "Vegan Leather Green sofa set with a premium finish",
        imagePath: "assets/furniture-image/8.jpg",
      ),
      CollectionDetailsModel(
        name: "Combo-Chair Set",
        price: "219",
        description:
            "Set of 2 chair and a table.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at malesuada nisi, non ultrices nunc. Sed eu eros est. Sed pharetra mollis rhoncus.",
        imagePath: "assets/furniture-image/2.jpg",
      ),
      CollectionDetailsModel(
        name: "3-Chair Set",
        price: "299",
        description:
            "3 Chair Set with different color tone.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at malesuada nisi, non ultrices nunc. Sed eu eros est. Sed pharetra mollis rhoncus.",
        imagePath: "assets/furniture-image/33.jpg",
      ),
    ],
  ),
];
List<String> furnitureCategory = [
  'All',
  'Brands',
  'Top',
  'Modern',
  'Sale',
  'New',
];
