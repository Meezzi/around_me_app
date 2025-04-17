import 'package:flutter/material.dart';

class PlaceSearchTextField extends StatefulWidget {
  const PlaceSearchTextField({super.key});

  @override
  State<PlaceSearchTextField> createState() =>
      _PlaceSearchTextFieldState();
}

class _PlaceSearchTextFieldState extends State<PlaceSearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        // TODO : 검색
      },
      decoration: InputDecoration(hintText: '검색어를 입력하세요'),
    );
  }
}
