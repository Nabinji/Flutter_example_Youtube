import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Model/category.dart';
import '../Model/product_model.dart';
import '../Utils/colors.dart';
import '../Utils/size.dart';
import 'product_detail.dart';

class MyEcommerceHome extends StatefulWidget {
  const MyEcommerceHome({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MyEcommerceHome> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig().init(context);
// list of category items
    List<List<Product>> selectcategories = [
      chairs,
      sofas,
      cupboards,
      table,
      wardrobe,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RawMaterialButton(
            onPressed: () {},
            constraints: const BoxConstraints(
              minWidth: 10,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Colors.white,
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              'image/ecommerce-image/menu.svg',
              width: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                'Discover your best furniture',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              )),

          // for search bar
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                contentPadding: const EdgeInsets.all(15),
                fillColor: Colors.grey[100],
                filled: true,
                hintText: 'Search',
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // for category ites
          SizedBox(
            height: SizeConfig.verticalSize * 7.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesList.length,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.only(
                  left: index == 0 ? 25 : 0,
                  right: 20,
                ),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    backgroundColor:
                        selectedIndex == index ? primary : Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    categoriesList[index].title,
                    style: TextStyle(
                      color: selectedIndex == index ? Colors.white : textGray,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                const Text(
                  'Popular',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
                const Spacer(),
                Text(
                  'View all',
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(selectcategories[selectedIndex].length,
                  (index) {
                final product = selectcategories[selectedIndex][index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(product: product),
                      ),
                    );
                  },
                  child: Hero(
                    tag: product.image,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: (SizeConfig.screenWidth - 80) / 2,
                      height: SizeConfig.verticalSize * 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(product.image),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // for image name and price
                          Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                      style: const TextStyle(
                                        color: Colors.black45,
                                        fontSize: 17,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      product.price,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 10,
                                bottom: 5,
                                child: RawMaterialButton(
                                  onPressed: () {},
                                  constraints: const BoxConstraints(
                                    minWidth: 0,
                                  ),
                                  shape: const CircleBorder(),
                                  fillColor: primary,
                                  padding: const EdgeInsets.all(5),
                                  child: const Icon(
                                    Icons.add,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
