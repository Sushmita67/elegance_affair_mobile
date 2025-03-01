// import 'package:elegance/features/cart/domain/entity/cart_item_entity.dart';
// import 'package:elegance/features/cart/presentation/view_model/cart_bloc.dart';
// import 'package:elegance/features/order/presentation/view/order_screen_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../app/constants/api_endpoints.dart';
//
// class CartScreenView extends StatelessWidget {
//   const CartScreenView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Simulated local data (for reference, not used in the Bloc state)
//     final List<Map<String, dynamic>> cartItems = [
//       {
//         'image': 'assets/images/smirnoff.png',
//         'name': 'Smirnoff Lemon Vodka',
//         'description': 'A refreshing lemon-flavored vodka.',
//         'price': 2.98,
//         'quantity': 1,
//       },
//       {
//         'image': 'assets/images/smirnoff.png',
//         'name': 'Jack Daniel’s Cola Whiskey',
//         'description': 'Smooth cola-infused whiskey blend.',
//         'price': 3.98,
//         'quantity': 1,
//       },
//       {
//         'image': 'assets/images/smirnoff.png',
//         'name': 'Calsberg Premium Beer',
//         'description': 'Crisp, premium quality beer.',
//         'price': 3.50,
//         'quantity': 1,
//       }
//     ];
//
//     // Dynamically calculate total price
//     double calculateTotalPrice(List<CartItemEntity> items) {
//       return items.fold(
//           0.0, (total, item) => total + item.price * item.quantity);
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Cart',
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Color(0xFFFFF8E7),
//         foregroundColor: Colors.black,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart),
//             onPressed: () {
//               // TODO: Handle cart icon tap
//             },
//           ),
//         ],
//       ),
//
//       body: BlocBuilder<CartBloc, CartState>(
//         builder: (context, state) {
//           if (state.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (state.error != null) {
//             return Center(child: Text("Error: ${state.error}"));
//           }
//           if (state.items.isEmpty) {
//             return const Center(child: Text("Your cart is empty"));
//           }
//
//           double totalPrice = calculateTotalPrice(state.items);
//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   itemCount: state.items.length,
//                   itemBuilder: (context, index) {
//                     final item = state.items[index];
//                     return Card(
//                       margin: const EdgeInsets.symmetric(vertical: 8),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Row(
//                           children: [
//                             Image.network(
//                               "${ApiEndpoints.imageLocationUrl}${ item.productImage}",
//
//                               width: 60,
//                               height: 60,
//                               fit: BoxFit.cover,
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     item.productName,
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     item.productDescription,
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.grey.shade600,
//                                     ),
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 2,
//                                   ),
//                                   const SizedBox(height: 8),
//                                   // Using a Wrap widget to avoid overflow on smaller devices:
//                                   Wrap(
//                                     crossAxisAlignment: WrapCrossAlignment.center,
//                                     spacing: 8,
//                                     runSpacing: 4,
//                                     children: [
//                                       IconButton(
//                                         padding: EdgeInsets.zero,
//                                         constraints: const BoxConstraints(),
//                                         icon: const Icon(Icons.remove),
//                                         onPressed: () {
//                                           if (item.quantity > 1) {
//                                             context.read<CartBloc>().add(
//                                               RemoveProductFromCartEvent(
//                                                 productId: item.productId,
//                                                 userId: "sushmita123",
//                                                 productName: item.productName,
//                                                 productPrice: item.price,
//                                                 productQuantity: 1,
//                                               ),
//                                             );
//                                           } else {
//                                             context.read<CartBloc>().add(
//                                               RemoveProductFromCartEvent(
//                                                 productId: item.productId,
//                                                 userId: "sushmita123",
//                                                 productName: item.productName,
//                                                 productPrice: item.price,
//                                                 productQuantity: item.quantity,
//                                               ),
//                                             );
//                                           }
//                                         },
//                                       ),
//                                       Text(
//                                         item.quantity.toString(),
//                                         style: const TextStyle(fontSize: 16),
//                                       ),
//                                       IconButton(
//                                         padding: EdgeInsets.zero,
//                                         constraints: const BoxConstraints(),
//                                         icon: const Icon(Icons.add),
//                                         onPressed: () {
//                                           context.read<CartBloc>().add(
//                                             AddProductToCartEvent(
//                                               productId: item.productId,
//                                               userId: "sushmita123",
//                                               productName: item.productName,
//                                               productPrice: item.price,
//                                               productQuantity: item.quantity + 1,
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                       Text(
//                                         '\$${item.price.toStringAsFixed(2)}',
//                                         style: const TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       IconButton(
//                                         padding: EdgeInsets.zero,
//                                         constraints: const BoxConstraints(),
//                                         icon: const Icon(Icons.delete),
//                                         onPressed: () {
//                                           context.read<CartBloc>().add(
//                                             RemoveProductFromCartEvent(
//                                               productId: item.productId,
//                                               userId: "sushmita123",
//                                               productName: item.productName,
//                                               productPrice: item.price,
//                                               productQuantity: item.quantity,
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               // Total Price and Proceed to Order Section
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Total:',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           '\$${totalPrice.toStringAsFixed(2)}',
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 12),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => OrderScreenView(
//                               cartItems: state.items,
//                               totalPrice: totalPrice,
//                             ),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         minimumSize: const Size(double.infinity, 50),
//                       ),
//                       child: const Text(
//                         'Proceed to Order',
//                         style: TextStyle(fontSize: 18, color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }


// import 'package:elegance/features/cart/domain/entity/cart_item_entity.dart';
// import 'package:elegance/features/cart/presentation/view_model/cart_bloc.dart';
// import 'package:elegance/features/order/presentation/view/order_screen_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../app/constants/api_endpoints.dart';
//
// class CartScreenView extends StatelessWidget {
//   const CartScreenView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double calculateTotalPrice(List<CartItemEntity> items) {
//       return items.fold(0.0, (total, item) => total + item.price * item.quantity);
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Shopping Cart',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFFF9F6F2), // Soft Ivory Background
//         foregroundColor: Color(0xFF1C1C1C), // Deep Black Text
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: BlocBuilder<CartBloc, CartState>(
//         builder: (context, state) {
//           if (state.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (state.error != null) {
//             return Center(child: Text("Error: ${state.error}"));
//           }
//           if (state.items.isEmpty) {
//             return const Center(
//               child: Text(
//                 "Your cart is empty",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//               ),
//             );
//           }
//
//           double totalPrice = calculateTotalPrice(state.items);
//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   padding: const EdgeInsets.all(16),
//                   itemCount: state.items.length,
//                   itemBuilder: (context, index) {
//                     final item = state.items[index];
//                     return Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 8,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       margin: const EdgeInsets.only(bottom: 12),
//                       padding: const EdgeInsets.all(12),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.network(
//                               "${ApiEndpoints.imageLocationUrl}${item.productImage}",
//                               width: 80,
//                               height: 80,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   item.productName,
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   item.productDescription,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey.shade600,
//                                   ),
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.remove, size: 20),
//                                       onPressed: () {
//                                         if (item.quantity > 1) {
//                                           context.read<CartBloc>().add(
//                                             RemoveProductFromCartEvent(
//                                               productId: item.productId,
//                                               userId: "sush123",
//                                               productName: item.productName,
//                                               productPrice: item.price,
//                                               productQuantity: 1,
//                                             ),
//                                           );
//                                         } else {
//                                           context.read<CartBloc>().add(
//                                             RemoveProductFromCartEvent(
//                                               productId: item.productId,
//                                               userId: "sush123",
//                                               productName: item.productName,
//                                               productPrice: item.price,
//                                               productQuantity: item.quantity,
//                                             ),
//                                           );
//                                         }
//                                       },
//                                     ),
//                                     Text(
//                                       item.quantity.toString(),
//                                       style: const TextStyle(fontSize: 16),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.add, size: 20),
//                                       onPressed: () {
//                                         context.read<CartBloc>().add(
//                                           AddProductToCartEvent(
//                                             productId: item.productId,
//                                             userId: "sush123",
//                                             productName: item.productName,
//                                             productPrice: item.price,
//                                             productQuantity: item.quantity + 1,
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                     const Spacer(),
//                                     Text(
//                                       '\$${item.price.toStringAsFixed(2)}',
//                                       style: const TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                         color: Color(0xFFC9A060), // Gold Accent
//                                       ),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete, color: Colors.red),
//                                       onPressed: () {
//                                         context.read<CartBloc>().add(
//                                           RemoveProductFromCartEvent(
//                                             productId: item.productId,
//                                             userId: "sush123",
//                                             productName: item.productName,
//                                             productPrice: item.price,
//                                             productQuantity: item.quantity,
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:elegance/features/cart/domain/entity/cart_item_entity.dart';
import 'package:elegance/features/cart/presentation/view_model/cart_bloc.dart';
import 'package:elegance/features/order/presentation/view/order_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/constants/api_endpoints.dart';

class CartScreenView extends StatelessWidget {
  const CartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    double calculateTotalPrice(List<CartItemEntity> items) {
      return items.fold(0.0, (total, item) => total + item.price * item.quantity);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Shopping Cart',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFFFF8E7),
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error != null) {
            return Center(child: Text("Error: ${state.error}"));
          }
          if (state.items.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }

          double totalPrice = calculateTotalPrice(state.items);
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Reduced radius
                      ),
                      elevation: 4, // Added subtle shadow
                      child: Padding(
                        padding: const EdgeInsets.all(16.0), // Increased padding
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                "${ApiEndpoints.imageLocationUrl}${item.productImage}",
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16), // Increased spacing
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center, // Centered the product name and description
                                children: [
                                  Text(
                                    item.productName,
                                    textAlign: TextAlign.center, // Center aligned text
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600, // Bolder text
                                    ),
                                  ),
                                  Text(
                                    item.productDescription,
                                    textAlign: TextAlign.center, // Center aligned text
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade900, // Lighter color
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center, // Center the quantity buttons and price
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove_circle_outline),
                                        onPressed: () {
                                          if (item.quantity > 1) {
                                            context.read<CartBloc>().add(
                                              RemoveProductFromCartEvent(
                                                productId: item.productId,
                                                userId: "sush123",
                                                productName: item.productName,
                                                productPrice: item.price,
                                                productQuantity: 1,
                                              ),
                                            );
                                          } else {
                                            context.read<CartBloc>().add(
                                              RemoveProductFromCartEvent(
                                                productId: item.productId,
                                                userId: "sush123",
                                                productName: item.productName,
                                                productPrice: item.price,
                                                productQuantity: item.quantity,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      Text(
                                        item.quantity.toString(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add_box),
                                        onPressed: () {
                                          context.read<CartBloc>().add(
                                            AddProductToCartEvent(
                                              productId: item.productId,
                                              userId: "sush123",
                                              productName: item.productName,
                                              productPrice: item.price,
                                              productQuantity: item.quantity + 1,
                                            ),
                                          );
                                        },
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Rs.${item.price.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 16), // Added space between price and delete icon
                                      IconButton(
                                        icon: const Icon(Icons.delete_outline, color: Colors.black45),
                                        onPressed: () {
                                          context.read<CartBloc>().add(
                                            RemoveProductFromCartEvent(
                                              productId: item.productId,
                                              userId: "sush123",
                                              productName: item.productName,
                                              productPrice: item.price,
                                              productQuantity: item.quantity,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Rs.${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700, // Increased font weight
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8), // Reduced space between total and the total price
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8), // Added padding
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8E7), // Light background color
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderScreenView(
                                cartItems: state.items,
                                totalPrice: totalPrice,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Slightly rounded corners
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text(
                          'Proceed to Order',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
