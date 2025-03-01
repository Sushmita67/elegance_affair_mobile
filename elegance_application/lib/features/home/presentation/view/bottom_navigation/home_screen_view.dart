// import 'package:elegance/app/di/di.dart';
// import 'package:elegance/features/cart/presentation/view_model/cart_bloc.dart';
// import 'package:elegance/features/product/domain/entity/product_entity.dart';
// import 'package:elegance/features/product/presentation/view/single_product_view.dart';
// import 'package:elegance/features/product/presentation/view_model/product_bloc.dart';
// // 1) Import your direction detector
// import 'package:elegance/sensor/direction.detector.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../../../app/constants/api_endpoints.dart';
//
// class HomeScreenView extends StatelessWidget {
//   const HomeScreenView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // appBar: AppBar(
//       //   elevation: 0,
//       //   backgroundColor: Colors.white,
//       //   automaticallyImplyLeading: false,
//       //   title: const Column(
//       //     crossAxisAlignment: CrossAxisAlignment.start,
//       //     children: [
//       //       Text(
//       //         'DELIVER TO',
//       //         style: TextStyle(
//       //           fontSize: 12,
//       //           color: Colors.grey,
//       //         ),
//       //       ),
//       //       Text(
//       //         'Home - 15/4 Roadway',
//       //         style: TextStyle(
//       //           fontSize: 16,
//       //           fontWeight: FontWeight.bold,
//       //           color: Colors.black,
//       //         ),
//       //       ),
//       //     ],
//       //   ),
//       //   actions: [
//       //     IconButton(
//       //       // 2) Replace old profile icon with a compass icon
//       //       icon: const Icon(Icons.explore, color: Colors.black),
//       //       onPressed: () {
//       //         // 3) Show a dialog containing DirectionDetector
//       //         showDialog(
//       //           context: context,
//       //           builder: (BuildContext context) {
//       //             return Dialog(
//       //               shape: RoundedRectangleBorder(
//       //                 borderRadius: BorderRadius.circular(12),
//       //               ),
//       //               child: const DirectionDetector(),
//       //             );
//       //           },
//       //         );
//       //       },
//       //     ),
//       //   ],
//       // ),
//
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(100), // Adjust height as needed
//         child: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.white,
//           automaticallyImplyLeading: false,
//           centerTitle: true,
//           title: SvgPicture.asset(
//             'assets/icons/logo-1.svg',
//             height: 80, // Adjust image height if needed
//           ),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.explore, color: Colors.black),
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return Dialog(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: const DirectionDetector(),
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//
//
//
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 10),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search for drink',
//                 prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide.none,
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//               ),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               height: 150,
//               child: PageView(
//                 children: [
//                   Image.asset('assets/images/offer1.png', fit: BoxFit.cover),
//                   Image.asset('assets/images/offer2.png', fit: BoxFit.cover),
//                   Image.asset('assets/images/offer3.jpg', fit: BoxFit.cover),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Explore Categories',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _buildCategoryItem('Whisky', Icons.local_drink),
//                 _buildCategoryItem('Beer', Icons.sports_bar),
//                 _buildCategoryItem('Rum', Icons.liquor),
//                 _buildCategoryItem('Sparkler', Icons.wine_bar),
//                 _buildCategoryItem('Vodka', Icons.emoji_food_beverage),
//               ],
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Popular Liquor',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             BlocBuilder<ProductBloc, ProductState>(
//               builder: (context, state) {
//                 if (state.isLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state.error != null) {
//                   return Center(child: Text(state.error!));
//                 } else if (state.products.isEmpty) {
//                   return const Center(child: Text("No products available"));
//                 }
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: state.products.length,
//                   itemBuilder: (context, index) {
//                     final product = state.products[index];
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => BlocProvider.value(
//                               value: getIt<CartBloc>(),
//                               child: SingleProductView(product: product),
//                             ),
//                           ),
//                         );
//                       },
//                       child: _buildProductCard(product),
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCategoryItem(String title, IconData icon) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundColor: Colors.grey[200],
//           child: Icon(icon, size: 30, color: Colors.black),
//         ),
//         const SizedBox(height: 5),
//         Text(
//           title,
//           style: const TextStyle(fontSize: 14),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildProductCard(ProductEntity product) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       padding: const EdgeInsets.all(10.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withValues(alpha:0.1),
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Image.network(
//             "${ApiEndpoints.imageLocationUrl}${ product.imageUrl}",
//             width: 60,
//             height: 60,
//             fit: BoxFit.contain,
//             errorBuilder: (context, error, stackTrace) {
//               return Container(
//                 width: 60,
//                 height: 60,
//                 color: Colors.grey[200],
//                 child: const Icon(Icons.error),
//               );
//             },
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   product.name,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   "In Stock: ${product.stock}",
//                   style: const TextStyle(
//                     fontSize: 14,
//                     color: Colors.red,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   product.longDescription,
//                   style: const TextStyle(fontSize: 14, color: Colors.grey),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             '\$${product.price}',
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.green,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:elegance/app/di/di.dart';
import 'package:elegance/features/cart/presentation/view_model/cart_bloc.dart';
import 'package:elegance/features/product/domain/entity/product_entity.dart';
import 'package:elegance/features/product/presentation/view/single_product_view.dart';
import 'package:elegance/features/product/presentation/view_model/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/constants/api_endpoints.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for jewelry',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),
            // Banner / Offer Section
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/images/ring.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  '25% OFF\nToday\'s Special',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Categories Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'See All',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategory('Rings', Icons.ring_volume_outlined),
                _buildCategory('Necklaces', Icons.diamond),
                _buildCategory('Earrings', Icons.earbuds),
              ],
            ),
            const SizedBox(height: 20),
            // Popular Jewelry Section
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Jewelry',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'See All',
                  style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.error != null) {
                  return Center(child: Text(state.error!));
                } else if (state.products.isEmpty) {
                  return const Center(child: Text("No jewelry available"));
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: getIt<CartBloc>(),
                              child: SingleProductView(product: product),
                            ),
                          ),
                        );
                      },
                      child: _buildProductCard(product),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String name, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.orangeAccent),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontSize: 14, color: Colors.black87)),
      ],
    );
  }

  Widget _buildProductCard(ProductEntity product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              "${ApiEndpoints.imageLocationUrl}${product.imageUrl}",
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("Stock: ${product.stock}", style: const TextStyle(color: Colors.orangeAccent)),
                Text(
                  product.longDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Text("Rs. ${product.price}", style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
