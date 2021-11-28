import 'package:catalog/models/catalogp.dart';

// catalog field
class CartModel {
   late CatalogModel _catalog;

// Collection of Ids - store Ids of each item
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set Catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
