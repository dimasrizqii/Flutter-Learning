import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repositories/cart_repository.dart';
import '../models/cart_item.dart';

class CartRepositoryImpl implements CartRepository {
  final FirebaseFirestore _firestore;

  CartRepositoryImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference _getUserCartCollection(String userId) {
    return _firestore.collection('carts').doc(userId).collection('items');
  }

  @override
  Future<List<CartItem>> getCartItems(String userId) async {
    try {
      final snapshot = await _getUserCartCollection(userId).get();
      return snapshot.docs
          .map(
            (doc) => CartItem.fromFirestore(
              doc.data() as Map<String, dynamic>,
              doc.id,
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to load cart items: $e');
    }
  }

  @override
  Future<void> addCartItem(String userId, CartItem item) async {
    try {
      await _getUserCartCollection(
        userId,
      ).doc(item.productId.toString()).set(item.toFirestore());
    } catch (e) {
      throw Exception('Failed to add cart item: $e');
    }
  }

  @override
  Future<void> updateCartItem(String userId, CartItem item) async {
    try {
      await _getUserCartCollection(
        userId,
      ).doc(item.productId.toString()).update(item.toFirestore());
    } catch (e) {
      throw Exception('Failed to update cart item: $e');
    }
  }

  @override
  Future<void> removeCartItem(String userId, int productId) async {
    try {
      await _getUserCartCollection(userId).doc(productId.toString()).delete();
    } catch (e) {
      throw Exception('Failed to remove cart item: $e');
    }
  }

  @override
  Future<void> clearCart(String userId) async {
    try {
      final snapshot = await _getUserCartCollection(userId).get();
      final batch = _firestore.batch();
      for (var doc in snapshot.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
    } catch (e) {
      throw Exception('Failed to clear cart: $e');
    }
  }

  @override
  Stream<List<CartItem>> watchCartItems(String userId) {
    return _getUserCartCollection(userId).snapshots().map(
      (snapshot) => snapshot.docs
          .map(
            (doc) => CartItem.fromFirestore(
              doc.data() as Map<String, dynamic>,
              doc.id,
            ),
          )
          .toList(),
    );
  }
}
