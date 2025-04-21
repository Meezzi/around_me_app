import 'package:around_me_app/ui/pages/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceSearchTextField extends ConsumerStatefulWidget {
  const PlaceSearchTextField({super.key});

  @override
  ConsumerState<PlaceSearchTextField> createState() =>
      _PlaceSearchTextFieldState();
}

class _PlaceSearchTextFieldState extends ConsumerState<PlaceSearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        _onSubmitted(value);
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

  void _onSubmitted(String query) {
    ref.read(homeViewModelProvider.notifier).searchPlace(query);
  }
}
