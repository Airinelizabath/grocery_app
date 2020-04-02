import 'package:flutter/cupertino.dart';
class GroceryItem {
  int id;
  String mer;
  String titles;
  String desc;
  String price;
  String imageUrl;
  bool carted;
  int quantity;

  GroceryItem({
    @required this.id,
    @required this.mer,//merchant
    @required this.titles,
    @required this.desc,
    @required this.price,
    @required this.imageUrl,
    @required this.carted,
    this.quantity=1
});
  void incQuantity()
  {this.quantity=this.quantity+1;}
  void decQuantity()
  {this.quantity=this.quantity-1;}
}

class GroceryItemList {
  List<GroceryItem> groceryitem;
  GroceryItemList({@required this.groceryitem});
}

GroceryItemList  groceryItemList =GroceryItemList(groceryitem: [
  GroceryItem(id: 1, mer:'FRESHO',titles:'Onion', desc:'250 gms',price: 'Rs 35', imageUrl: 'assets/onion.jpg',carted:true),
  GroceryItem(id:  2,mer:'FRESHO', titles: 'Potato', desc:'1 kg',price: 'Rs 40 ', imageUrl:'assets/potato.jpg',carted:true ),
  GroceryItem(id: 3,mer:'FRESHO', titles: 'Cucumber', desc:'500 gms',price: 'Rs 30', imageUrl: 'assets/cucumber.jpg',carted:true),
  GroceryItem(id: 4,mer:'FRESHO', titles: 'Carrot', desc:'500 gms',price: 'Rs 20', imageUrl: 'assets/carrot.jpg',carted:false)
]);
