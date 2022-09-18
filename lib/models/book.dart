class Book {
  var _id;
  var _name;
  var _author;
  var _pages;
  var _rating;
  var _genre;

  Book(this._id, this._name, this._author, this._pages, this._rating,
      this._genre);

  Map<String, dynamic> toJson() => {
        'id': _id,
        'name': _name,
        'author': _author,
        'pages': _pages,
        'rating': _rating,
        'Genre': _genre
      };

  Book.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _author = json['author'],
        _pages = json['pages'],
        _rating = json['rating'],
        _genre = json['genre'];

  get id => _id;

  set id(value) {
    _id = value;
  }

  get genre => _genre;

  set genre(value) {
    _genre = value;
  }

  get rating => _rating;

  set rating(value) {
    _rating = value;
  }

  get pages => _pages;

  set pages(value) {
    _pages = value;
  }

  get author => _author;

  set author(value) {
    _author = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }
}
