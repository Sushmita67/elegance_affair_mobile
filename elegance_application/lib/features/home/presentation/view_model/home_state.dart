import 'package:elegance/app/di/di.dart';
import 'package:elegance/features/cart/presentation/view/cart_screen_view.dart';
import 'package:elegance/features/cart/presentation/view_model/cart_bloc.dart';
import 'package:elegance/features/home/presentation/view/bottom_navigation/home_screen_view.dart';
import 'package:elegance/features/profile/presentation/view/profile_screen_view.dart';
import 'package:elegance/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:elegance/features/setting/presentation/view/setting_screen_view.dart';
import 'package:elegance/features/setting/presentation/view_model/setting_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  /// Initial state with predefined views
  static HomeState initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        const HomeScreenView(),
        BlocProvider.value(
          value: getIt<CartBloc>(),
          child: const CartScreenView(),
        ),
        BlocProvider.value(
          value: getIt<ProfileCubit>(),
          child: const ProfileScreenView(),
        ),
        BlocProvider.value(
          value: getIt<SettingCubit>(),
          child: const SettingScreenView(),
        ),
      ],
    );
  }

  /// Create a new state with updated properties
  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
