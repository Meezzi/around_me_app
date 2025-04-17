import 'package:flutter/material.dart';

class PlaceInfoCard extends StatelessWidget {
  const PlaceInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _placeHeader('삼성 1동 주민센터'),
            Text('공공, 사회기관 > 행정 복지센터'),
            Text('서울특별시 강남구 봉은사로 616 삼성1동 주민센터'),
          ],
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
