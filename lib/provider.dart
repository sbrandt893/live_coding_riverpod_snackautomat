import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_coding_riverpod_snackautomat/vending_machine_model.dart';
import 'package:live_coding_riverpod_snackautomat/vending_machine_notifier.dart';

final vendingMachineProvider =
    StateNotifierProvider<VendingMachineNotifier, VendingMachine>((ref) {
  return VendingMachineNotifier();
});
