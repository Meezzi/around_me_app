class Place {
  String title;
  String category;
  String roadAddress;

  Place({
    required this.title,
    required this.category,
    required this.roadAddress,
  });

  Place.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      category = json['category'],
      roadAddress = json['roadAddress'];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'roadAddress': roadAddress,
    };
  }
}
