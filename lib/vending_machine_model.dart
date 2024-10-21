import 'package:live_coding_riverpod_snackautomat/null_wrapper.dart';
import 'package:live_coding_riverpod_snackautomat/product_model.dart';

class VendingMachine {
  final List<Product> products;
  final Product? selectedProduct;
  final int insertedAmount;
  final int changeAmount;

  VendingMachine({
    required this.products,
    this.selectedProduct,
    this.insertedAmount = 0,
    this.changeAmount = 0,
  });

  VendingMachine copyWith({
    List<Product>? products,
    Wrapper<Product?>? selectedProduct,
    int? insertedAmount,
    int? changeAmount,
  }) {
    return VendingMachine(
      products: products ?? this.products,
      selectedProduct: selectedProduct != null
          ? selectedProduct.value
          : this.selectedProduct,
      insertedAmount: insertedAmount ?? this.insertedAmount,
      changeAmount: changeAmount ?? this.changeAmount,
    );
  }

  @override
  String toString() {
    return 'VendingMachine{products: $products, selectedProduct: $selectedProduct, insertedAmount: $insertedAmount, changeAmount: $changeAmount}';
  }
}
