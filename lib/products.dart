class Product {
  final int? id;
  final String? slug;
  final String? vehicleName;
  final String? manufacture;
  final String? condition;
  final String? mileage;
  final String? price;
  final String? imageName;
  final String? dropdownFontLight;
    final String? dropdownFontLightAnswer;
    final String? brandName;
    final String? detailsEngine;
    final String? transmission;
    final String? fuel;
    final String? skeleton;
    final String? registration;
    final String? grede;
    final String? model;


  // productCode,
  // image,
  // unitPrice,
  // totalPrice,
  // createAt,
  // quantity;

  Product( 
     {
    this.imageName,
    this.id,
    this.slug,
    this.vehicleName,
    this.manufacture,
    this.condition,
    this.mileage,
    this.price,
    this.dropdownFontLight,
    this.dropdownFontLightAnswer,
    this.brandName,
    this.detailsEngine,
    this.transmission,
    this.fuel,
    this.skeleton,
    this.registration,
    this.grede,
    this.model,
    // required this.productCode,
    // required this.image,
    // required this.unitPrice,
    // required this.totalPrice,
    // required this.createAt,
    // required this.quantity
  });
}
