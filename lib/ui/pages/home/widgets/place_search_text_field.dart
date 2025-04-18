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
      controller: _placeController,
      decoration: InputDecoration(hintText: '검색어를 입력하세요'),
    );
  }

  final _placeController = TextEditingController();

  @override
  void dispose() {
    _placeController.dispose();
    super.dispose();
  }
}
