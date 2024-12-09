class CartItem {
  final String name;      // Name of the item
  int quantity;           // Quantity of the item
  final double price;     // Price of a single item
  final String imageUrl;  // Image URL for the item
  final String documentId; // Firestore document ID

  CartItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.imageUrl,
    required this.documentId,
  });

  // Convert CartItem to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  // Create CartItem from Map
  factory CartItem.fromMap(Map<String, dynamic> map, {required String documentId}) {
    return CartItem(
      name: map['name'],
      quantity: map['quantity'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      documentId: documentId,
    );
  }

  // Create a copy of the CartItem with a new documentId
  CartItem copyWith({String? documentId}) {
    return CartItem(
      name: name,
      quantity: quantity,
      price: price,
      imageUrl: imageUrl,
      documentId: documentId ?? this.documentId,
    );
  }
}
