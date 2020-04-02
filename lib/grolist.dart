import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class itemContainer extends StatelessWidget {
  final GroceryItem groceryItem;
  itemContainer({@required this.groceryItem});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Item(
          mer :groceryItem.mer,
          titles:groceryItem.titles,
          desc:groceryItem.desc,
          price:groceryItem.price,
          imageUrl:groceryItem.imageUrl,
        )
    );
  }
}
class Item extends StatelessWidget{
  Item({
    @required this.mer,
    @required this.titles,
    @required this.desc,
    @required  this.price,
    @required  this.imageUrl,
  });

  final String mer;
  final String titles;
  final String desc;
  final String price;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(left: 40,right: 20,top:10),
      child: Container(
        color: Colors.grey[300],
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                height: 150,
                width: 140,
                child: Image(
                  image:AssetImage(imageUrl),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    mer,//merchant name
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                  SizedBox(height:20),
                  Text(titles),
                  Text(desc),
                  SizedBox(height:20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      SizedBox(width: 20.0,),
                      Container(
                        height: 30.0,
                        width: 70.0,
                        child: FlatButton(
                          onPressed: (){
                           // addToCart(groceryItem);
                          },
                          child: Text('ADD'),
                          textColor: Colors.white,
                          color: Colors.red,
                          highlightColor: Colors.black,
                          //  child:Text('ADD'),

                        ),

                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
