class Book {
  String title;
  double price;
  String cover;
  String author;
  String genre;
  String lanugage;
  String authorImg;
  bool seller;
  String summary;
  String showImage;
  String age;
  double rating;

  Book({
    required this.title,
    required this.price,
    required this.cover,
    required this.author,
    required this.age,
    required this.authorImg,
    required this.seller,
    required this.genre,
    required this.lanugage,
    required this.summary,
    required this.showImage,
    required this.rating,
  });
}

List<Book> booklist = [
   Book(
    title: "How to build a Billion Dollar App",
    cover:
        "https://www.bargainbookhutonline.com/public/storage/products/7295/TfVLLU77X6yPNzzkXEBRDHbKoFOMP42nSyhWMTVb.jpeg",
    age: "ALL AGE",
    author: "George",
    authorImg:
        "https://images-na.ssl-images-amazon.com/images/I/6100CMqLo6L._UY200_.jpg",
    seller: false,
    genre: "Self Analysis",
    lanugage: "ENGLISH",
    price: 20.45,
    rating: 4.5,
    summary:
        "Berkowski draws exclusively on the inside stories of the billion-dollar app club members, including Instagram, Whatsapp, Snapchat, Candy Crush and Uber to provide all the information you need to create your own spectacularly successful mobile business. He guides you through each step, from an idea scribbled on the back of an envelope, through to finding a cofounder, building a team, attracting (and keeping) millions of users, all the way through to juggling the pressures of being CEO of a billion-dollar company (and still staying ahead of the competition).",
    showImage: "https://images.gr-assets.com/books/1420791474l/23658963.jpg",
  ),
  Book(
    title: "Harry Potter and the Deathly Hallows",
    cover:
        "https://cdn.europosters.eu/image/750/posters/harry-potter-philosopher-s-stone-i104639.jpg",
    age: "ALL AGE",
    author: "J. K. Rowling",
    authorImg:
        "https://www.bloomsbury.com/media/r41o2jaa/j-k-rowling.png?width=500&height=500",
    seller: true,
    genre: "Fantasy",
    lanugage: "ENGLISH",
    rating: 5.0,
    price: 30.00,
    summary:
        "Without the guidance and protection of their professors, Harry (Daniel Radcliffe), Ron (Rupert Grint) and Hermione (Emma Watson) begin a mission to destroy the Horcruxes, the sources of Voldemort's immortality. Though they must rely on one another more than ever, dark forces threaten to tear them apart. Voldemort's Death Eaters have seized control of the Ministry of Magic and Hogwarts, and they are searching for Harry -- even as he and his friends prepare for the ultimate showdown.",
    showImage:
        "https://www.pluggedin.com/wp-content/uploads/2020/01/harry-potter-and-the-deathly-hallows-part-2.jpg",
  ),
  Book(
    title: "A Song Of Ice And Fire",
    cover:
        "https://m.media-amazon.com/images/I/81vel6463aL._AC_UF1000,1000_QL80_.jpg",
    age: "ABOVE 18",
    author: "R. R. Martin",
    authorImg:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Portrait_photoshoot_at_Worldcon_75%2C_Helsinki%2C_before_the_Hugo_Awards_%E2%80%93_George_R._R._Martin.jpg/1200px-Portrait_photoshoot_at_Worldcon_75%2C_Helsinki%2C_before_the_Hugo_Awards_%E2%80%93_George_R._R._Martin.jpg",
    seller: true,
    genre: "Sci-Fi",
    lanugage: "ENGLISH",
    price: 20.14,
    rating: 4.5,
    summary:
        "Game of Thrones is roughly based on the storylines of A Song of Ice and Fire, set in the fictional Seven Kingdoms of Westeros and the continent of Essos. The series chronicles the violent dynastic struggles among the realm's noble families for the Iron Throne, while other families fight for independence from it.",
    showImage:
        "https://m.media-amazon.com/images/S/aplus-media/sota/8362069e-fd2f-4f2c-921f-2d5cdfb0775c.__CR0,0,970,600_PT0_SX970_V1___.jpg",
  ),
  Book(
    title: "The Lord Of The Rings",
    cover:
        "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg",
    age: "ALL AGE",
    author: "J. R. R. Tolkien",
    authorImg:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJA6kQWR4l52ykTTtyFuUb6WEmXixGqzU4_QWIOLS0bfIGCUMW",
    seller: true,
    genre: "Sci-Fi",
    lanugage: "ENGLISH",
    rating: 4.0,
    price: 19.40,
    summary:
        "The future of civilization rests in the fate of the One Ring, which has been lost for centuries. Powerful forces are unrelenting in their search for it. But fate has placed it in the hands of a young Hobbit named Frodo Baggins (Elijah Wood), who inherits the Ring and steps into legend. A daunting task lies ahead for Frodo when he becomes the Ringbearer - to destroy the One Ring in the fires of Mount Doom where it was forged.",
    showImage:
        "https://deadline.com/wp-content/uploads/2022/08/lord-of-the-rings-feature-image.jpg?w=1000",
  ),
  Book(
    title: "Rita Hayworth and Shawshank Redemption",
    cover:
        "https://georgelthomas.com/wp-content/uploads/2024/01/rita-hayworth-and-shawshank-redemption-book-cover.jpeg?w=667",
    age: "ABOVE 18",
    author: "Steven King",
    authorImg: "https://images.gr-assets.com/authors/1362814142p5/3389.jpg",
    seller: true,
    genre: "Crime Fiction",
    lanugage: "ENGLISH",
    price: 9.99,
    rating: 4.9,
    summary:
        "Andy Dufresne (Tim Robbins) is sentenced to two consecutive life terms in prison for the murders of his wife and her lover and is sentenced to a tough prison. However, only Andy knows he didn't commit the crimes. While there, he forms a friendship with Red (Morgan Freeman), experiences brutality of prison life, adapts, helps the warden, etc., all in 19 years.",
    showImage:
        "https://static1.srcdn.com/wordpress/wp-content/uploads/2021/09/The-shawshank-redemption-cut-rita-hayworth-from-the-title.jpg",
  ),
  Book(
    title: "The Da Vinci Code",
    cover:
        "https://upload.wikimedia.org/wikipedia/en/thumb/6/6b/DaVinciCode.jpg/220px-DaVinciCode.jpg",
    age: "ALL AGE",
    author: "Dan Brown",
    authorImg:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Dan_Brown_November_2015.jpg/220px-Dan_Brown_November_2015.jpg",
    seller: false,
    genre: "Mystery-Thriller",
    lanugage: "ENGLISH",
    price: 18.45,
    rating: 4.1,
    summary:
        "A murder in Paris' Louvre Museum and cryptic clues in some of Leonardo da Vinci's most famous paintings lead to the discovery of a religious mystery. For 2,000 years a secret society closely guards information that -- should it come to light -- could rock the very foundations of Christianity.",
    showImage: "",
  ),
  Book(
    title: "Fantastic Beasts And Where To Find Them",
    cover:
        "https://upload.wikimedia.org/wikipedia/en/thumb/8/8d/Fantastic_beasts.JPG/220px-Fantastic_beasts.JPG",
    age: "ALL AGE",
    author: "J. K. Rowling",
    authorImg:
        "https://hips.hearstapps.com/hmg-prod/images/gettyimages-1061157246.jpg",
    seller: false,
    genre: "Fantasy",
    lanugage: "ENGLISH",
    price: 22.22,
    rating: 3.5,
    summary:
        "The year is 1926, and Newt Scamander (Eddie Redmayne) has just completed a global excursion to find and document an extraordinary array of magical creatures. Arriving in New York for a brief stopover, he might have come and gone without incident, were it not for a No-Maj (American for Muggle) named Jacob, a misplaced magical case, and the escape of some of Newt's fantastic beasts, which could spell trouble for both the wizarding and No-Maj worlds.",
    showImage:
        "https://upload.wikimedia.org/wikipedia/en/thumb/8/8d/Fantastic_beasts.JPG/220px-Fantastic_beasts.JPG",
  ),
  Book(
    title: "The Adventures Of Sherlock Holmes",
    cover:
        "https://sterling-us.imgix.net/covers/9781454945321.jpg?auto=format&h=648",
    age: "ALL AGE",
    author: "Arthur Doyle",
    authorImg:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Arthur_Conan_Doyle_by_Walter_Benington%2C_1914.png/220px-Arthur_Conan_Doyle_by_Walter_Benington%2C_1914.png",
    seller: false,
    genre: "Suspense",
    lanugage: "ENGLISH",
    price: 15.31,
    rating: 4.0,
    summary:
        "All of the stories within The Adventures of Sherlock Holmes are told in a first-person narrative from the point of view of Dr. Watson, as is the case for all but four of the Sherlock Holmes stories. The Oxford Dictionary of National Biography entry for Doyle suggests that the short stories contained in The Adventures of Sherlock Holmes tend to point out social injustices, such as 'a king's betrayal of an opera singer, a stepfather's deception of his ward as a fictitious lover, an aristocratic crook's exploitation of a failing pawnbroker, a beggar's extensive estate in Kent.' ",
    showImage:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Adventures_of_sherlock_holmes.jpg/220px-Adventures_of_sherlock_holmes.jpg",
  ),
 
];
