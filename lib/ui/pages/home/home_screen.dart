import 'package:around_me_app/ui/pages/home/home_view_model.dart';
import 'package:around_me_app/ui/pages/home/widgets/place_info_list.dart';
import 'package:around_me_app/ui/pages/home/widgets/place_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: PlaceSearchTextField(),
          actions: [
            IconButton(
              onPressed: () {
                ref
                    .read(homeViewModelProvider.notifier)
                    .searchByCurrentLocation();
              },
              icon: Icon(Icons.gps_fixed),
            ),
          ],
        ),
        body: Padding(padding: const EdgeInsets.all(12.0), child: PlaceList()),
      ),
    );
  }
}
