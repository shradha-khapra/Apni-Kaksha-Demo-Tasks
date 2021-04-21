class Product {
  int id, price, mrp;
  String description, location;
  String images;
  int count;

  Product({
    this.id,
    this.images,
    this.mrp,
    this.location,
    this.count,
    this.price,
    this.description,
  });
}

List<String> amountlist = ["5 kg", "10 kg", "15 kg", '20 kg'];

List<Product> demoProducts = [
  Product(
      id: 1,
      price: 25,
      images: "assets/rice/image1.jpg",
      mrp: 30,
      description: "Gold Plus Basmati Rice",
      count: 0,
      location: "Super Store - Indrapuram"),
  Product(
      id: 2,
      price: 35,
      images: "assets/rice/image2.jpg",
      mrp: 30,
      description: "Silver Plus Basmati Rice",
      count: 0,
      location: "Super Store - Indrapuram"),
  Product(
      id: 3,
      price: 75,
      images: "assets/rice/image3.jpg",
      mrp: 30,
      description: "Elephant Basmati Rice",
      count: 0,
      location: "Super Store - Indrapuram"),
  Product(
      id: 4,
      price: 80,
      images: "assets/rice/image4.jpg",
      mrp: 30,
      description: "Royal White Basmati Rice",
      count: 0,
      location: "Super Store - Indrapuram"),
  Product(
      id: 5,
      price: 40,
      images: "assets/rice/image5.jpg",
      mrp: 30,
      description: "Kohinoor Basmati Rice",
      count: 0,
      location: "Super Store - Indrapuram"),
  Product(
      id: 6,
      price: 15,
      images: "assets/rice/image5.jpg",
      mrp: 30,
      description: "Indica Basmati Rice",
      count: 0,
      location: "Super Store - Indrapuram"),
  Product(
      id: 7,
      price: 45,
      images: "assets/rice/image5.jpg",
      mrp: 30,
      description: "Jasmine Basmati Rice",
      count: 0,
      location: "Super Store - Indrapuram"),
];
