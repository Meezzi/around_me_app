import 'package:around_me_app/ui/pages/home/widgets/place_search_text_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(appBar: AppBar(title: PlaceSearchTextField())),
    );
  }
}
