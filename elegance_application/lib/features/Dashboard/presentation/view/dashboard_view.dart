import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/dashboard_bloc.dart';
import '../view_model/dashboard_event.dart';
import '../view_model/dashboard_state.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc()..add(LoadDashboardData()),
      child: Scaffold(
        body: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.errorMessage.isNotEmpty) {
              return Center(child: Text(state.errorMessage));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state.category,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                // Centered, Side-scrollable Image Section
                SizedBox(
                  height: 200,
                  child: Center(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final imageIndex = index % state.imagePaths.length;
                        return Container(
                          width: 150,
                          height: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(state.imagePaths[imageIndex]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Just for You', style: TextStyle(fontSize: 22)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
