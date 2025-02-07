import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState.initial()) {
    on<LoadDashboardData>(_onLoadDashboardData);
  }

  void _onLoadDashboardData(
      LoadDashboardData event, Emitter<DashboardState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      // Simulating fetching data (replace with API or local asset logic)
      await Future.delayed(const Duration(seconds: 2));

      final List<String> images = [
        'assets/images/jewelry1.jpg',
        'assets/images/jewelry2.jpg',
        'assets/images/jewelry3.jpg',
      ];

      emit(state.copyWith(
        imagePaths: images,
        category: 'New Arrivals',
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
          errorMessage: "Failed to load data", isLoading: false));
    }
  }
}
