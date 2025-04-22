class Place {
  String title;
  String category;
  String roadAddress;
  String link;

  Place({
    required this.title,
    required this.category,
    required this.roadAddress,
    required this.link,
  });

  Place.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      category = json['category'],
      roadAddress = json['roadAddress'],
      link = json['link'];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'roadAddress': roadAddress,
      'link': link,
    };
  }
}
