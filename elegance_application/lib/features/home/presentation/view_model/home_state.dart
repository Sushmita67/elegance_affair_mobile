import 'package:flutter/material.dart';

class HomeState {
  final int selectedIndex;
  final List<Widget> views;

  HomeState({required this.selectedIndex, required this.views});

  // Factory method to define the initial state
  factory HomeState.initial() {
    return HomeState(
      selectedIndex: 0, // Default tab index
      views: [
        Center(child: Text('Dashboard View')),
        Center(child: Text('Course View')),
        Center(child: Text('Batch View')),
        Center(child: Text('Account View')),
      ],
    );
  }

  // CopyWith method to create a new instance with updated values
  HomeState copyWith({int? selectedIndex, List<Widget>? views}) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }
}
