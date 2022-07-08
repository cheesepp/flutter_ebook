class Book {
  String id;
  String name;
  List<dynamic> images;
  String? description;
  int? numberOfFavorite;
  bool isFavorite = false;
  dynamic rating = 0;
  int amount;
  String? author;
  int? yearOfPublishcation;
  String? authorSurname;
  int pages;
  Book({
    required this.images,
    required this.id,
    required this.name,
    this.description,
    this.numberOfFavorite,
    required this.isFavorite,
    required this.rating,
    required this.amount,
    this.author,
    this.yearOfPublishcation,
    this.authorSurname,
    required this.pages,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    // List<dynamic> imgFromJson = [];
    // json['images'].values((value) => imgFromJson.add(value));
    return Book(
      images: json['images'] as List<dynamic>,
      id: json['id'],
      name: json['name'],
      amount: json['amount'],
      description: json['description'],
      isFavorite: json['isFavorite'],
      rating: json['rating'],
      author: json['author'],
      authorSurname: json['authorSurname'],
      pages: json['pages'],
      numberOfFavorite: json['numberOfFavorite'],
      yearOfPublishcation: json['yearOfPublishcation'],
    );
  }

  Map toJson() => {
        'id': id,
        'name': name,
        'amount': amount,
        'description': description,
        'isFavorite': isFavorite,
        'rating': rating,
        'author': author,
        'authorSurname': authorSurname,
        'pages': pages,
        'numberOfFavorite': numberOfFavorite,
        'yearOfPublishcation': yearOfPublishcation,
      };
}
