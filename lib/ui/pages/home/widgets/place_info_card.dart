import 'package:around_me_app/data/model/place.dart';
import 'package:around_me_app/ui/detail/detail_screen.dart';
import 'package:flutter/material.dart';

class PlaceInfoCard extends StatelessWidget {
  final Place place;
  const PlaceInfoCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(place.link)),
        );
      },
      child: Card.outlined(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _placeHeader(place.title),
              Text(place.category),
              Text(place.roadAddress),
            ],
          ),
        ),
      ),
    );
  }

  Widget _placeHeader(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
