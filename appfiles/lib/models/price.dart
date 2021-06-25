class PriceItem {
  int price;

  PriceItem(){
    price=0;
  }

  increasePrice(int val) {
    price += val;
  }

  decreasePrice(int val) {
    price -= val;
  }

  int getPrice() {
    return price;
  }
}
