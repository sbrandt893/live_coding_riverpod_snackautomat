class Product {
  final String name;
  final int priceInCents;

  Product({required this.name, required this.priceInCents});

  Product copyWith({String? name, int? priceInCents}) {
    return Product(
      name: name ?? this.name,
      priceInCents: priceInCents ?? this.priceInCents,
    );
  }

  @override
  String toString() {
    return 'Product{name: $name, priceInCents: $priceInCents}';
  }
}

final List<Product> productList = [
  Product(name: 'Chips', priceInCents: 50),
  Product(name: 'WineGums', priceInCents: 100),
  Product(name: 'Snickers', priceInCents: 75),
];
