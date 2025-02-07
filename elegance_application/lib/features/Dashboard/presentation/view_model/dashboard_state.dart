import 'package:equatable/equatable.dart';

class DashboardState extends Equatable {
  final List<String> imagePaths;
  final String category;
  final bool isLoading;
  final String errorMessage;

  const DashboardState({
    required this.imagePaths,
    required this.category,
    required this.isLoading,
    required this.errorMessage,
  });

  // Initial state
  factory DashboardState.initial() {
    return const DashboardState(
      imagePaths: [],
      category: '',
      isLoading: true,
      errorMessage: '',
    );
  }

  // CopyWith method to update state immutably
  DashboardState copyWith({
    List<String>? imagePaths,
    String? category,
    bool? isLoading,
    String? errorMessage,
  }) {
    return DashboardState(
      imagePaths: imagePaths ?? this.imagePaths,
      category: category ?? this.category,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [imagePaths, category, isLoading, errorMessage];
}
