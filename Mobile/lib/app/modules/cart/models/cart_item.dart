class CartItem {
  final String? documentId; // Firestore document ID
  final String image;
  final String name;
  final int price; // Price as an integer
  final String date;
  final int quantity;
  final List<String> toppings; // List to store selected toppings

  CartItem({
    this.documentId, // Document ID is optional
    required this.image,
    required this.name,
    required this.price,
    required this.date,
    required this.quantity,
    this.toppings = const [], // Default to an empty list if no toppings
  });

  // Method to create CartItem from Firestore document data
  factory CartItem.fromMap(Map<String, dynamic> data, {required String documentId}) {
    return CartItem(
      documentId: documentId,
      image: data['image'] ?? '',
      name: data['name'] ?? '',
      price: (data['price'] as num).toInt(),
      date: data['date'] ?? '',
      quantity: data['quantity'] ?? 1,
      toppings: List<String>.from(data['toppings'] ?? []), // Load toppings
    );
  }

  // Method to convert CartItem to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'price': price,
      'date': date,
      'quantity': quantity,
      'toppings': toppings, // Include toppings in map
    };
  }

  // Method to create a copy of CartItem with a new documentId
  CartItem copyWith({String? documentId}) {
    return CartItem(
      documentId: documentId ?? this.documentId,
      image: image,
      name: name,
      price: price,
      date: date,
      quantity: quantity,
      toppings: toppings, // Carry over toppings
    );
  }
}
