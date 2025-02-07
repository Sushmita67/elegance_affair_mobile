import 'package:elegance_application/features/Dashboard/presentation/view_model/dashboard_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/di.dart';
import '../../../Dashboard/presentation/view/dashboard_view.dart';
import '../../../product/presentation/view/product_view.dart';
import '../../../product/presentation/view_model/product_bloc.dart';
import '../../../profile/presentation/view/about_us_view.dart';
import '../../../profile/presentation/view_model/about_us_bloc.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  HomeState({required this.selectedIndex, required this.views});

  // Factory method to define the initial state
  factory HomeState.initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        BlocProvider(
          create: (context) => getIt<DashboardBloc>(),
          child: DashboardView(),
        ),

        Center(child: Text('Cart')),

        BlocProvider(
          create: (context) => getIt<ProductBloc>(),
          child: ProductView(),
        ),

        BlocProvider(
          create: (context) => getIt<AboutBloc>(),
          child: AboutView(),
        ),
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

  @override
  List<Object?> get props => [selectedIndex, views];
}
