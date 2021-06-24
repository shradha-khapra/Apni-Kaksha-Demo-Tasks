import 'package:shopit/data/models/product.dart';

class DummyDataService {
  List<Product> _riceList = [
    Product(
      productId: 1,
      productName: "Basmati Rice",
      description: "Gold Standard Rice Fit For All",
      productPrice: 299,
      imagePath: "assets/images/basmati.jpg",
      quantityInCart: 0,
    ),
    Product(
      productId: 2,
      productName: "Daawat Rice",
      description: "Gold Standard Rice Fit For All",
      productPrice: 249,
      imagePath: "assets/images/daawat.jpg",
      quantityInCart: 1,
    ),
    Product(
      productId: 3,
      productName: "Hemani Rice",
      description: "Gold Standard Rice Fit For All",
      productPrice: 199,
      imagePath: "assets/images/hemani.jpeg",
      quantityInCart: 0,
    ),
    Product(
      productId: 4,
      productName: "Khusbhoo Rice",
      description: "Gold Standard Rice Fit For All",
      productPrice: 379,
      imagePath: "assets/images/khushbhoo.jpg",
      quantityInCart: 0,
    ),
  ];
  List<Product> getRiceProducts() => _riceList;
}
