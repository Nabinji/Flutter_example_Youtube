import 'facilities_model.dart';

List<String> categories = [
  'Popular',
  'Nearby',
  'Hotel',
  'Mountain',
];

class Member {
  final String image;

  Member({required this.image});
}

List<String> members = [
  'assets/members/girl1.jpg',
  'assets/members/man1.jpg',
  'assets/members/man2.jpg',
  'assets/members/girl2.jpg',
  'assets/members/girl3.jpg',
];

class Destination {
  final int? id, price;
  final String? name, description, image, category, location;
  final double? rate;
  final List<String>? members;
  final List<Facilities>? facilities;

  Destination(
      {this.name,
      this.price = 111,
      this.id,
      this.category,
      this.description,
      this.image,
      this.members,
      this.facilities,
      this.rate,
      this.location});
}

List<Destination> destinations = [
  Destination(
    id: 1,
    name: "Clerck Well House",
    price: 320,
    category: 'Nearby',
    members: [members[0], members[2], members[1]],
    image:
        "https://www.dreamtinyliving.com/wp-content/uploads/2023/07/Beautiful-Small-House-Design-Idea-7mx6m-1.jpg",
    location: "Luton,London",
    description:
        "Clerck Well House doesn't appear to be a widely recognized term or name. Could you provide more context or details about what you mean by Clerck Well House? Are you referring to a specific place, historical site, or something else? This will help me provide a more accurate response.",
    facilities: [facilities[0], facilities[1], facilities[2], facilities[3]],
    rate: 4.6,
  ),
  Destination(
    id: 2,
    name: "MM hotels",
    category: 'Nearby',
    members: [members[0], members[2], members[1]],
    image: "https://mmhotels.in/wp-content/uploads/2024/01/istockphoto-104731717-612x612-1.jpg",
    location: "Mumbai,India",
    description:
        "The MM Hotels in Palm Beach is an iconic boutique hotel known for its vibrant colors, luxurious accommodations, and a long history dating back to the 1940s. It's a popular destination for both tourists and celebrities, offering a mix of old-world charm and modern amenities.",
    facilities: [facilities[0], facilities[1], facilities[2], facilities[3]],
    rate: 4.6,
  ),
  Destination(
    id: 4,
    name: "Colony Hotel",
    category: 'hotel',
    image: "https://cf.bstatic.com/xdata/images/hotel/max1024x768/492106100.jpg?k=e5094f3f7d90049f7afda56b1e4756a152dfe658b5731b5de61cd50bc04c0e33&o=&hp=1",
    location: "Miami, United State",
    facilities: [facilities[0], facilities[1], facilities[7], facilities[3]],
    members: [members[0], members[2], members[1]],
    description:
        "The Colony Hotel in Palm Beach is an iconic boutique hotel known for its vibrant colors, luxurious accommodations, and a long history dating back to the 1940s. It's a popular destination for both tourists and celebrities, offering a mix of old-world charm and modern amenities.",
    rate: 4.5,
  ),
  Destination(
    id: 5,
    name: "Hotel Mystic Mountain",
    category: 'hotel',
    image: "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2023/money/0moneylocal2hotel-1691592512.jpg&w=900&height=601",
    location: "Kathmandu, Nepal",
    facilities: [facilities[0], facilities[1], facilities[7], facilities[3]],
    members: [members[0], members[2], members[1]],
    description:
        "Hotel Mystic Mountain, nestled deep in the lush forest of a hilltop in Nagarkot, has announced a plan to upgrade to a five-star property, buoyed by continuous demand for hotel rooms by visitors.Since it opened in July 2017, the modern hexagon-shaped building blocks of the resort have become a hot topic among trend-conscious Nepalis.",
    rate: 4.5,
  ),
  Destination(
    id: 6,
    name: "Nepali Ghar Hotel",
    category: 'hotel',
    image: "https://cf.bstatic.com/xdata/images/hotel/max1024x768/160737100.jpg?k=fc3ba3c9d68b03c2dd22e256d7a4351d1a018de68648de68999116d215b67558&o=&hp=1",
    facilities: [facilities[0], facilities[1], facilities[6], facilities[3]],
    members: [members[0], members[2], members[1]],
    location: "Lombok, Indonesia",
    description:
        "Conveniently situated in the centre of Kathmandu, Nepali Ghar Hotel provides air-conditioned rooms with free WiFi, free private parking and room service. This 4-star hotel offers a 24-hour front desk and a concierge service. The hotel has a terrace and city views, and guests can enjoy a meal at the restaurant or a drink at the bar.",
    rate: 4.5,
  ),
  Destination(
    id: 7,
    members: [members[0], members[2], members[1]],
    name: "Gunung Kerinci",
    image: "https://www.wildsumatra.com/wp-content/uploads/2016/10/mt-kerinci.jpg",
    category: "mountain",
    location: "Jambi, Indonesia",
    facilities: [facilities[4], facilities[1], facilities[2], facilities[5]],
    description:
        "Gunung Kerinci (juga dieja 'Kerintji', dan dikenal sebagai Gunung Gadang, Merapi) adalah gunung tertinggi di Sumatra, gunung berapi tertinggi di Indonesia, dan puncak tertinggi di Indonesia di luar Papua. Gunung Kerinci terletak tepat di perbatasan antara Provinsi Sumatera Barat dengan Provinsi Jambi, di Pegunungan Bukit Barisan, dekat pantai barat, dan terletak sekitar 130 km sebelah selatan Padang Provinsi Sumatra Barat. Gunung ini juga menjadi batas antara wilayah Etnis Minangkabau dengan Suku Kerinci yang dikelilingi hutan lebat Taman Nasional Kerinci Seblat dan merupakan habitat harimau sumatra dan badak sumatra.",
    rate: 4,
  ),
  Destination(
    id: 3,
    name: "Mount Everest",
    category: 'nearby',
    facilities: [facilities[6], facilities[1], facilities[2], facilities[3]],
    members: [members[0], members[2], members[1]],
    image: "https://cdn.britannica.com/17/83817-050-67C814CD/Mount-Everest.jpg",
    location: "Kathmandu, Nepal",
    description:
        "Mount Everest, mountain on the crest of the Great Himalayas of southern Asia that lies on the border between Nepal and the Tibet Autonomous Region of China, at 27°59′ N 86°56′ E. Reaching an elevation of 29,032 feet (8,849 metres), Mount Everest is the highest mountain in the world.",
    rate: 5.0,
  ),
  Destination(
    id: 8,
    name: "The Bagmati River",
    facilities: [facilities[4], facilities[1], facilities[2], facilities[5]],
    category: "mountain",
    members: [members[0], members[2], members[1]],
    image: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Pashupatinath2.jpg/1200px-Pashupatinath2.jpg",
    location: "Kathmandu Nepal ",
    description:
        "The Bagmati River[n 1] flows through the Kathmandu valley of Nepal, separating the cities of Kathmandu and Patan, before flowing through Madesh Province of southern Nepal and joining the Kamla River in the Indian state of Bihar. It is considered holy by both Hindus and Buddhists. A number of Hindu temples are located on its banks.The importance of the Bagmati also lies in the fact that Hindus are cremated on the banks of this holy river, and Kirants are buried in the hills by its side.",
    rate: 4.4,
  ),
  Destination(
    id: 1,
    name: "Kuta Mandalika",
    category: 'beach',
    image: "https://gomandalika.com/wp-content/uploads/2023/10/Kuta-Mandalika-4.jpg",
    facilities: [facilities[6], facilities[1], facilities[2], facilities[3]],
    location: "Lombok, Indonesia",
    members: [members[0], members[2], members[1]],
    description:
        "The Mandalika Project covers 1,175 hectares of coastal land in Kuta, South Lombok, and will, when complete, be home to more than 16,000 hotel rooms, a waterpark, a 27-hole golf course, 1,500 villas, and an international-standard motor-racing circuit. The estimated cost of the venture is believed to exceed US\$3 billion.",
    rate: 4.4,
  ),
  Destination(
    id: 9,
    name: "Annapurna South",
    category: "mountain",
    members: [members[0], members[2], members[1]],
    image: "https://upload.wikimedia.org/wikipedia/commons/f/fa/Annapurna_South-4588.jpg",
    facilities: [facilities[4], facilities[1], facilities[2], facilities[5]],
    location: "Pokhara, Kathmandu",
    description:
        "Annapurna South (Nepali: अन्नपूर्ण दक्षिण) is a mountain in the Annapurna Himal range of the Himalayas located in Nepal, and the 101st-highest mountain in the world. It is the 5th highest peak of the Annapurna mountain range. It was first ascended in 1964,[1] and is 7,219 metres (23,684 ft) tall. The nearby mountain Hiunchuli is in fact an extension of Annapurna South.",
    rate: 4,
  ),
  Destination(
    id: 10,
    name: "She Remains The Taj",
    category: "hotel",
    members: [members[0], members[1]],
    facilities: [facilities[0], facilities[1], facilities[6], facilities[7]],
    image: "https://i.pinimg.com/736x/7b/70/0b/7b700b2d923f3a8c7f9cdc0f32284091.jpg",
    location: "India",
    description:
        "We pride ourselves in fostering a culture that holds our women guests in the highest regard, and nurtures our women stakeholders. Reflecting this culture, 'She Remains The Taj' is a celebration of the warmth and spirit of every woman. With this initiative, we reaffirm our commitment to encourage and support women as guests, employeess, partners and beyond.",
    rate: 4.4,
  ),
  Destination(
    id: 11,
    name: "Pashupatinath Temple",
    members: [members[0], members[2]],
    facilities: [facilities[0], facilities[6], facilities[7], facilities[3]],
    category: "nearby",
    image: "https://www.holidify.com/images/cmsuploads/compressed/shutterstock_627150563_20190822130709_20190822154343.jpg",
    location: "Kathmandu Nepal",
    description:
        "One of the holiest Hindu shrines in Nepal, the Pashupatinath Temple is a UNESCO World Heritage Site and a Shaktipeetha. It consists of 518 small temples and a main pagoda house. The temple complex is only open to Hindus. It is believed that the Jyotirlinga housed in the Pashupatinath temple is the head of the body, which is made up of the twelve Jyotirlinga in India.",
    rate: 4.4,
  ),
  Destination(
    id: 12,
    name: "Grand Hotel",
    category: "hotel",
    facilities: [facilities[4], facilities[1], facilities[2], facilities[5]],
    members: [members[0], members[2], members[1], members[3]],
    image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/e6/39/8c/grand-hotel-kathmandu.jpg?w=700&h=-1&s=1",
    location: "KTM Nepal",
    description:
        "Grand Hotel, Kathmandu is a 4-star hotel in Nepal strategically located in the heart of the city's dynamic business, cultural and entertainment hubs. Some of the major landmarks of the city are located within accessible distance from the hotel which include the Swoyambhunath (Monkey Temple), National Museum and the Seto Gumba (White Monastery) . Other attractions near the hotel include Casino Mahjong, United World Trade Centre and Bluebird Mall.",
    rate: 4.4,
  ),
 
  
];
