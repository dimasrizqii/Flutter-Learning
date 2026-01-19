import '../../data/models/cart_item.dart';

abstract class CartRepository {
  /// Get all cart items for a specific user
  Future<List<CartItem>> getCartItems(String userId);

  /// Add an item to the cart
  Future<void> addCartItem(String userId, CartItem item);

  /// Update an existing cart item (usually quantity)
  Future<void> updateCartItem(String userId, CartItem item);

  /// Remove an item from the cart
  Future<void> removeCartItem(String userId, int productId);

  /// Clear all items from the cart
  Future<void> clearCart(String userId);

  /// Watch cart items in real-time
  Stream<List<CartItem>> watchCartItems(String userId);
}
