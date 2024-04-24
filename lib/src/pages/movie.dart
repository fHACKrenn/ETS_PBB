class Movie {
  final int id;
  final String title;
  final String posterUrl;
  final String description;

  Movie({this.id, this.title, this.posterUrl, this.description});

  factory Movie.fromMap(Map<String, dynamic> data) {
    return Movie(
      id: data['id'],
      title: data['title'],
      posterUrl: data['posterUrl'],
      description: data['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'posterUrl': posterUrl,
      'description': description,
    };
  }
}
