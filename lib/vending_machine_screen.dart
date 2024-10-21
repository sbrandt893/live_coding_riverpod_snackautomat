import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_coding_riverpod_snackautomat/coin_model.dart';
import 'package:live_coding_riverpod_snackautomat/provider.dart';

class VendingMachineScreen extends ConsumerWidget {
  const VendingMachineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendingMachine = ref.watch(vendingMachineProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // display all products
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final product in vendingMachine.products)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: vendingMachine.selectedProduct == product
                          ? Colors.blue
                          : Colors.white,
                    ),
                    onPressed: () {
                      if (vendingMachine.selectedProduct == product) {
                        ref
                            .read(vendingMachineProvider.notifier)
                            .unselectProduct();
                        return;
                      }

                      ref
                          .read(vendingMachineProvider.notifier)
                          .selectProduct(product);
                    },
                    child: Text(product.name),
                  ),
              ],
            ),
            // display selected product
            Column(
              children: [
                const Text('Selected product:', style: TextStyle(fontSize: 20)),
                Text(vendingMachine.selectedProduct?.name ?? 'Nothing selected',
                    style: const TextStyle(fontSize: 20)),
              ],
            ),
            Column(
              children: [
                const Text('Selected product price:',
                    style: TextStyle(fontSize: 20)),
                Text(
                    vendingMachine.selectedProduct != null
                        ? '${(vendingMachine.selectedProduct!.priceInCents / 100).toStringAsFixed(2)}€'
                        : '0',
                    style: const TextStyle(fontSize: 20)),
              ],
            ),

            // display inserted amount in € format
            Text(
                'Inserted amount: ${(vendingMachine.insertedAmount / 100).toStringAsFixed(2)}€'),
            // display change amount
            Text(
                'Change amount: ${(vendingMachine.changeAmount / 100).toStringAsFixed(2)}€'),
            // display all coins in a row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final coin in coinList)
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(vendingMachineProvider.notifier)
                          .insertCoin(coin.valueInCents);
                    },
                    child: Text(coin.valueInCents.toString()),
                  ),
              ],
            ),

            // display buy button
            ElevatedButton(
              onPressed: () {
                ref.read(vendingMachineProvider.notifier).buyProduct();
              },
              child: const Text('Buy'),
            ),
          ],
        ),
      ),
    );
  }
}
