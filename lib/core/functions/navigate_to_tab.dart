import 'package:clot/main_view.dart';
import 'package:flutter/material.dart';

void navigateToTab(BuildContext context, int index) {
  final mainViewState = context.findAncestorStateOfType<MainViewState>();
  mainViewState?.changeTab(index);
}
