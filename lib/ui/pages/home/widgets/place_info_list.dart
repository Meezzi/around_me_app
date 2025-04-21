import 'package:around_me_app/ui/pages/home/home_view_model.dart';
import 'package:around_me_app/ui/pages/home/widgets/place_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceList extends ConsumerWidget {
  const PlaceList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(homeViewModelProvider);

    return ListView.separated(
      itemCount: places.length,
      separatorBuilder: (context, index) => SizedBox(height: 12),
      itemBuilder: (context, index) {
        final place = places[index];
        return PlaceInfoCard(place: place);
      },
    );
  }
}
