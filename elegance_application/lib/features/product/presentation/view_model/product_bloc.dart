import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/product_entity.dart';
import '../../domain/use_case/create_product_usecase.dart';
import '../../domain/use_case/delete_product_usecase.dart';
import '../../domain/use_case/get_all_product_usecase.dart';
import '../../domain/use_case/update_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final CreateProductUseCase _createProductUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;
  final DeleteProductUseCase _deleteProductUseCase;
  final UpdateProductUseCase _updateProductUseCase;

  ProductBloc({
    required CreateProductUseCase createProductUseCase,
    required GetAllProductsUseCase getAllProductsUseCase,
    required DeleteProductUseCase deleteProductUseCase,
    required UpdateProductUseCase updateProductUseCase,
  })  : _createProductUseCase = createProductUseCase,
        _getAllProductsUseCase = getAllProductsUseCase,
        _deleteProductUseCase = deleteProductUseCase,
        _updateProductUseCase = updateProductUseCase,
        super(ProductState.initial()) {
    on<LoadProducts>(_onLoadProducts);
    on<AddProduct>(_onAddProduct);
    on<DeleteProduct>(_onDeleteProduct);
    on<UpdateProduct>(_onUpdateProduct);

    add(LoadProducts());
  }

  Future<void> _onLoadProducts(
      LoadProducts event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getAllProductsUseCase.call();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (products) => emit(state.copyWith(
        isLoading: false,
        error: null,
        products: products,
      )),
    );
  }

  Future<void> _onAddProduct(
      AddProduct event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createProductUseCase.call(
      CreateProductParams(
          title: event.title, price: event.price, productId: ''),
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) => add(LoadProducts()),
    );
  }

  Future<void> _onDeleteProduct(
      DeleteProduct event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _deleteProductUseCase.call(
      DeleteProductParams(productId: event.productId, id: ''),
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) => add(LoadProducts()),
    );
  }

  Future<void> _onUpdateProduct(
      UpdateProduct event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true));

    final productEntity = ProductEntity(
      productId: event.productId,
      title: event.title,
      price: event.price,
      description: event.description,
      photo: '',
    );

    final result = await _updateProductUseCase.call(
      UpdateProductParams(
        product: productEntity,
        id: event.productId,
        productId: '',
        title: '',
        price: 999,
        description: '',
        photo: '',
      ),
    );

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) => add(LoadProducts()),
    );
  }
}
