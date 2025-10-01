import 'package:clot/features/watchlist/presentation/widgets/watchlist_view_body.dart';
import 'package:flutter/material.dart';

class WatchlistView extends StatelessWidget {
  const WatchlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: WatchlistViewBody()));
  }
}
