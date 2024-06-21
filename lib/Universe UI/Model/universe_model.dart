class PlanetInfo {
  final int id;
  final String name;
  final String iconImage;
  final String description;
  final List<String> images;

  PlanetInfo({
    required this.id,
    required this.name,
    required this.iconImage,
    required this.description,
    required this.images,
  });
}
// this is our model data for planets
List<PlanetInfo> planets = [
  PlanetInfo(
    id: 1,
    name: 'Mercury',
    iconImage: 'image/mercury.png',
    description:
        "Mercury, the closest planet to the Sun, it is the smallest in the solar system and has a heavily cratered surface similar to the Moon. Its thin atmosphere leads to extreme temperature fluctuations, with scorching days and freezing nights. Mercury's lack of atmosphere means it cannot retain heat, resulting in temperatures ranging from -173°C at night to 427°C during the day.",
    images: [
      'https://static.toiimg.com/thumb/msid-108510873,width-1280,height-720,resizemode-4/108510873.jpg',
      'https://images-assets.nasa.gov/image/PIA02570/PIA02570~orig.jpg?w=2800&h=1824&fit=clip&crop=faces%2Cfocalpoint',
      'https://media.wired.com/photos/60f8839376dfd2eea48937c2/master/pass/science_insight_layers.jpg',
    ],
  ),
  PlanetInfo(
    id: 2,
    name: 'Venus',
    iconImage: 'image/venus.png',
    description:
        "Venus, the second planet from the Sun, is similar in size and structure to Earth, earning it the title of Earth's 'sister planet'. However, its thick atmosphere, composed mainly of carbon dioxide with clouds of sulfuric acid, creates a runaway greenhouse effect, making its surface the hottest in the solar system at around 465°C. Venus rotates very slowly and in the opposite direction to most planets, meaning its day is longer than its year.",
    images: [
      "https://static.vecteezy.com/system/resources/previews/035/167/133/large_2x/ai-generated-venus-planet-background-photo.jpg",
          "https://i.pinimg.com/736x/46/ed/9c/46ed9c49d09ccb29d582cb19402cf6c2.jpg",
          "https://images.fineartamerica.com/images-medium-large/surface-of-venus-chris-butler.jpg",
    ],
  ),
  PlanetInfo(
      id: 3,
      name: 'Earth',
      iconImage: 'image/earth.png',
      description:
          "Earth, our home planet, is the third from the Sun and the only known planet to support life. It has a balanced atmosphere composed mainly of nitrogen and oxygen, which sustains a wide variety of ecosystems. Earth's surface is 71% water, which plays a crucial role in regulating its climate. The planet's diverse geology includes mountains, valleys, and volcanoes, and its dynamic weather systems contribute to its rich biodiversity.",
      images: [
        "https://cdn.dribbble.com/users/59947/screenshots/17108611/muti_2_4x.jpg",
        "https://assets-eu-01.kc-usercontent.com/80e06f8f-fc39-0158-c90c-a3da02f900f2/0548daa2-1f52-4a34-8dec-d00d8b5ee54e/PE3-Tile.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS99DFIPsRfd7QgOy1y6fwxEf90yxyD-m4v7ub7IqgipYYfBvuByGipB3htsr2UGMAwNFg&usqp=CAU",
        "https://as2.ftcdn.net/v2/jpg/05/58/15/49/1000_F_558154904_0ZTmtNsv37Anz8If5JoyMEcPSdeIhCwN.jpg",
      ]),
  PlanetInfo(
    id: 4,
    name: 'Mars',
    iconImage: 'image/mars.png',
    description:
        "Mars, the fourth planet from the Sun, is known as the Red Planet due to the iron oxide (rust) that covers its surface. Mars hosts the tallest volcano in the solar system, Olympus Mons, and the deepest canyon, Valles Marineris. Although it has a thin atmosphere composed mostly of carbon dioxide, evidence suggests that Mars once had liquid water on its surface, raising questions about past life.",
    images: [
      "https://cdn.mos.cms.futurecdn.net/EjjVxJ8DCca2MVc8qBGtXK.jpg",
      "https://idsb.tmgrup.com.tr/ly/uploads/images/2021/12/30/171195.jpg",
    ],
  ),
  PlanetInfo(
    id: 5,
    name: 'Jupiter',
    iconImage: 'image/jupiter.png',
    description:
        "Jupiter, the fifth planet from the Sun, is the largest in our solar system and a gas giant composed mainly of hydrogen and helium. Its most notable feature is the Great Red Spot, a massive storm larger than Earth that has persisted for centuries. Jupiter has at least 79 moons, including Ganymede, the largest moon in the solar system, which is even bigger than the planet Mercury. Jupiter's powerful magnetic field and numerous moons make it a mini solar system of its own.",
    images: [
      "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1500w,f_auto,q_auto:best/newscms/2018_37/2560766/180910-jupiter-magnetic-field-mn-0850.jpg",
          "https://i.insider.com/609aa91a342837001822cbd6?width=800&format=jpeg&auto=webp",
    ],
  ),
  PlanetInfo(
    id: 6,
    name: 'Saturn',
    iconImage: 'image/saturn.png',
    description:
        "Saturn, the sixth planet, is renowned for its stunning ring system, composed of ice and rock particles. Like Jupiter, Saturn is a gas giant primarily made of hydrogen and helium. It has at least 83 moons, with Titan being the largest. Titan is unique for its thick atmosphere and lakes of liquid methane and ethane, making it a subject of great interest for scientists studying prebiotic chemistry.",
    images: [
      "https://www.usatoday.com/gcdn/authoring/authoring-images/2023/11/07/USAT/71482293007-usatsi-21715384.jpg?crop=2843,1600,x0,y266&width=1600&height=800&format=pjpg&auto=webp",
      "https://cdn.mos.cms.futurecdn.net/p2UBxuRToGRziJFua2EYeF-1200-80.jpg",
    ],
  ),
  PlanetInfo(
    id: 7,
    name: 'Uranus',
    iconImage: 'image/uranus.png',
    description:
        "Uranus, the seventh planet from the Sun, is classified as an ice giant due to its composition of water, ammonia, and methane ices. It has a blue-green color because of methane in its atmosphere. Uranus is unique because it rotates on its side, with its axis nearly parallel to its orbit, possibly due to a colossal collision early in its history. This unusual tilt causes extreme seasonal variations. Uranus has at least 27 moons and faint rings.",
    images: [
      "https://www.earth.com/_next/image/?url=https%3A%2F%2Fcff2.earth.com%2Fuploads%2F2024%2F04%2F14082129%2Furanus_more-gassy_less-icy_moon_1-960x640.jpg&w=3840&q=75",
      "https://www.esa.int/var/esa/storage/images/esa_multimedia/images/2023/12/uranus_close-up_view_nircam/25369220-1-eng-GB/Uranus_close-up_view_NIRCam_pillars.jpg",
    ],
  ),
  PlanetInfo(
    id: 8,
    name: 'Neptune',
    iconImage: 'image/neptune.png',
    description:
        "Neptune, the eighth and farthest known planet from the Sun, is similar to Uranus in composition and appearance. It is an ice giant with a deep blue color, also due to atmospheric methane. Neptune is known for its strong winds and storms, including the Great Dark Spot, a storm comparable to Jupiter's Great Red Spot. Neptune has at least 14 moons, with Triton being the largest. Triton is geologically active, with geysers of nitrogen, and orbits the planet in the opposite direction of Neptune's rotation, indicating it may have been captured from the Kuiper Belt.",
    images: [
      "https://www.universetoday.com/wp-content/uploads/2024/01/079-e1704658997532.jpg",
      "https://starwalk.space/gallery/images/neptune-at-opposition-2021/1140x641.jpg",
      "https://cdn.mos.cms.futurecdn.net/PezBzd9Fehsq9XWgWMauVV-1200-80.jpg",
    ],
  ),
];
