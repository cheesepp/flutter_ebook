class Book {
  String id;
  String name;
  List<dynamic> images;
  String? description;
  double price;
  int? numberOfFavorite;
  bool isFavorite = false;
  dynamic rating = 0;
  int amount;
  int purchases = 0;
  String? author;
  int? yearOfPublishcation;
  String? authorSurname;
  int pages;
  Book({
    required this.price,
    required this.images,
    required this.id,
    required this.name,
    this.description,
    required this.purchases,
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
      price: json['price'],
      images: json['images'] as List<dynamic>,
      id: json['id'],
      name: json['name'],
      amount: json['amount'],
      purchases: json['purchases'],
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
        'price': price,
        'name': name,
        'amount': amount,
        'description': description,
        'isFavorite': isFavorite,
        'purchases': purchases,
        'rating': rating,
        'author': author,
        'authorSurname': authorSurname,
        'pages': pages,
        'numberOfFavorite': numberOfFavorite,
        'yearOfPublishcation': yearOfPublishcation,
      };

  @override
  String toString() {
    return '''
id: $id,
name: $name
amount: $amount
description: $description
isFavorite: $isFavorite
purchases: $purchases
rating: $rating
author: $author
authorSurname: $authorSurname
pages: $pages
numberOfFavorite: $numberOfFavorite
price: $price
yearOfPublishcation: $yearOfPublishcation ---''';
  }
}
