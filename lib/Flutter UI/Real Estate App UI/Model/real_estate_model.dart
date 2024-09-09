class House {
  final String image;
  final String price;
  final String name;
  final String place;
  final String beds;
  final String baths;
  final String size;
  final String description;

  House({
    required this.image,
    required this.price,
    required this.name,
    required this.place,
    required this.beds,
    required this.baths,
    required this.size,
    required this.description,
  });
}

List<House> realEstateModel = [
  House(
    image:
        "https://www.homepictures.in/wp-content/uploads/2020/01/1174-Square-Feet-2-Attached-Bedroom-Single-Floor-Modern-Beautiful-House-Design.jpg",
    price: "1199",
    name: "Whitespace house",
    place: "Melbourne, Australia",
    beds: "4",
    baths: "6",
    size: "500",
    description: description,
  ),
  House(
    image:
        "https://thermohouse.co.uk/wp-content/uploads/2019/04/hero-image.jpg",
    price: "850",
    name: "Wood White Modern House",
    place: "Perth, Australia",
    beds: "6",
    baths: "3",
    size: "240",
    description: description,
  ),
  House(
    image:
        "https://www.homelane.com/blog/wp-content/uploads/2022/11/single-floor-house-design.jpg",
    price: "450",
    name: "Modern Valley House",
    place: "Kathmandu, Nepal",
    beds: "2",
    baths: "5",
    size: "150",
    description: description,
  ),
  House(
    image:
        "https://cdn.britannica.com/43/93843-050-A1F1B668/White-House-Washington-DC.jpg",
    price: "290",
    name: "The White House",
    place: "Washington D.C., US",
    beds: "4",
    baths: "6",
    size: "400",
    description: description,
  ),
  House(
    image:
        "https://cf.bstatic.com/xdata/images/hotel/max1024x768/115335746.jpg?k=383770a3dd87860f57d061ada097c19dc88bfd5d76db9624b5d65fd25677d258&o=&hp=1",
    price: "999",
    name: "The House",
    place: "Kathmandu Nepal",
    beds: "3",
    baths: "2",
    size: "800",
    description: description,
  ),
  House(
    image:
        "https://media.architecturaldigest.com/photos/649b0bb4b5325d136f681641/16:9/w_2560%2Cc_limit/ElCerito_BKV_061223_030.jpg",
    price: "9999",
    name: "Dreame House",
    place: "Washington, US",
    beds: "9",
    baths: "6",
    size: "1500",
    description: description,
  ),
];
String description =
    "A house is a single-unit residential building. It may range in complexity from a rudimentary hut to a complex structure of wood, masonry, concrete or other material, outfitted with plumbing, electrical, and heating, ventilation, and air conditioning systems.[1][2] Houses use a range of different roofing systems to keep precipitation such as rain from getting into the dwelling space. Houses may have doors or locks to secure the dwelling space and protect its inhabitants and contents from burglars or other trespassers.";
