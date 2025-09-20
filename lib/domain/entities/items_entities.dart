class ItemsEntities {
  final int id;
  final String itemName;
  final String itemType;
  final String barcode;
  final String provider;
  final double price;
  final String status;
  final DateTime entryDate;

  ItemsEntities({
    required this.id,
    required this.itemName,
    required this.itemType,
    required this.barcode,
    required this.provider,
    required this.price,
    required this.status,
    required this.entryDate,
  });
}