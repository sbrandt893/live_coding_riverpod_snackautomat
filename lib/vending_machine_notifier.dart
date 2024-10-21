import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_coding_riverpod_snackautomat/null_wrapper.dart';
import 'package:live_coding_riverpod_snackautomat/product_model.dart';
import 'package:live_coding_riverpod_snackautomat/vending_machine_model.dart';

class VendingMachineNotifier extends StateNotifier<VendingMachine> {
  VendingMachineNotifier() : super(VendingMachine(products: productList));

  void selectProduct(Product product) {
    state = state.copyWith(selectedProduct: Wrapper(product));
  }

  void unselectProduct() {
    state = state.copyWith(selectedProduct: Wrapper(null));
  }

  void insertCoin(int amount) {
    state = state.copyWith(insertedAmount: state.insertedAmount + amount);
  }

  bool isPurchasePossible() {
    if (state.selectedProduct == null) {
      return false;
    }
    return state.insertedAmount >= state.selectedProduct!.priceInCents;
  }

  void buyProduct() {
    if (!isPurchasePossible()) {
      return;
    }

    state = state.copyWith(
      selectedProduct: Wrapper(null),
      insertedAmount: 0,
      changeAmount: state.insertedAmount - state.selectedProduct!.priceInCents,
    );
  }
}
