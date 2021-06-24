import 'package:shopit/data/models/product.dart';

class DummyDataService {
  List<Product> _riceList = [
    Product(
      productId: 1,
      productName: "Basmati Rice",
      description: "It Is A Long Established Fact",
      productPrice: 299,
      imagePath: "assets/images/basmati.jpg",
      quantityInCart: 0,
    ),
    Product(
      productId: 2,
      productName: "Daawat Rice",
      description: "That A Reader Will Be Distracted",
      productPrice: 249,
      imagePath: "assets/images/daawat.jpg",
      quantityInCart: 1,
    ),
    Product(
      productId: 3,
      productName: "Hemani Rice",
      description: "By The Readable Content Of A Page",
      productPrice: 199,
      imagePath: "assets/images/hemani.jpg",
      quantityInCart: 0,
    ),
    Product(
      productId: 4,
      productName: "Khusbhoo Rice",
      description: "While Looking At It's Layout",
      productPrice: 379,
      imagePath: "assets/images/khusbhoo.jpg",
      quantityInCart: 0,
    ),
    Product(
      productId: 5,
      productName: "Rozana Rice",
      description: "That's why you Lorem Ipsum",
      productPrice: 249,
      imagePath: "assets/images/rozana.jpg",
      quantityInCart: 0,
    ),
  ];
  List<Product> getRiceProducts() => _riceList;
}
