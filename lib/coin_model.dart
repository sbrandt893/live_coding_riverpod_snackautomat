class Coin {
  final String label;
  final int valueInCents;

  Coin({required this.label, required this.valueInCents});

  Coin copyWith({String? label, int? valueInCents}) {
    return Coin(
      label: label ?? this.label,
      valueInCents: valueInCents ?? this.valueInCents,
    );
  }

  @override
  String toString() {
    return 'Coin{label: $label, valueInCents: $valueInCents}';
  }
}

final List<Coin> coinList = [
  Coin(label: '2€', valueInCents: 200),
  Coin(label: '1€', valueInCents: 100),
  Coin(label: '50c', valueInCents: 50),
  Coin(label: '20c', valueInCents: 20),
  Coin(label: '10c', valueInCents: 10),
  Coin(label: '5c', valueInCents: 5),
  Coin(label: '2c', valueInCents: 2),
  Coin(label: '1c', valueInCents: 1),
];
