class OnBoard {
  final String image, text1, text2;
  OnBoard({
    required this.text1,
    required this.text2,
    required this.image,
  });
}

List<OnBoard> onboards = [
 
  OnBoard(
    image: 'https://static.vecteezy.com/system/resources/previews/013/951/374/large_2x/beautiful-close-up-ecology-nature-landscape-with-mountain-creek-abstract-long-exposure-forest-stream-with-pine-trees-and-green-foliage-background-autumn-tiny-waterfall-rocks-amazing-sunny-nature-photo.jpg',
    text1: 'Enjoy your',
    text2: 'trip in nature.',
  ),
   OnBoard(
    image:
        'https://img.freepik.com/free-vector/portrait-programmer-working-with-pc_23-2148222500.jpg?t=st=1725271521~exp=1725275121~hmac=ce89fddd322c3efd9f480a06ef3e8cab27f10ae61fcc015bb93dd339199f7ed4&w=1480',
    text1: 'Start your',
    text2: 'journey in coding.',
  ),
  OnBoard(
    image: 'https://img.freepik.com/free-photo/view-luxurious-villa-with-modern-architectural-design_23-2151694015.jpg?t=st=1725271693~exp=1725275293~hmac=81a5779b2535f64ce7e31aae447bdcdde338048488bacfed302a16151dd94805&w=900',
    text1: 'Let\'s make',
    text2: 'your dream vacation.',
  ),
];
