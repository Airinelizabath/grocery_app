import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/SignIn.dart';
import 'package:groceryapp/model.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: EdgeInsets.only(left:80),
          child: Text('My Cart'),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding:EdgeInsets.only(left:30,right: 30,top:20),
              child: Container(
                height: 500,
                child: ListView(
                  children: <Widget>[
                    for(var groceryItem in groceryItemList.groceryitem)
                        cartContainer(groceryItem:groceryItem),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 1,),
                  Text('Total : Rs. 50',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: FlatButton(
                        onPressed: ()=>Navigator.push(
                            context,MaterialPageRoute(
                            builder:(_)=>SignIn(),
                          ),
                          ),
                        child: Text('Check out'),
                        textColor: Colors.white,
                        color: Colors.red,
                        highlightColor: Colors.black,
                      ),

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class cartContainer extends StatelessWidget {
  final GroceryItem groceryItem;
  cartContainer({@required this.groceryItem});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Carted(
          mer :groceryItem.mer,
          titles:groceryItem.titles,
          desc:groceryItem.desc,
          price:groceryItem.price,
          imageUrl:groceryItem.imageUrl,
          carted:groceryItem.carted,
          quantity:groceryItem.quantity,
        )
    );
  }
}


class Carted extends StatelessWidget {
  Carted({
    @required this.mer,
    @required this.titles,
    @required this.desc,
    @required this.price,
    @required this.imageUrl,
    @required this.carted,
    @required this.quantity,
  });

  final String mer;
  final String titles;
  final String desc;
  final String price;
  final String imageUrl;
  final bool carted;
  int quantity;

  @override
  Widget build(BuildContext context) {
    return carted ? Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        height: 130,
        color: Colors.grey[300],
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                // color: Colors.white,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(2, 10),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_up),
                        onPressed: () {
                          incQuantity();
                        },
                        // highlightColor: Colors.black45,
                      ),
                      //SizedBox(height:2.0),
                      Text(quantity.toString()),
                      // SizedBox(height:2.0),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_down),
                        onPressed: () {
                          decQuantity();
                        },
                        // iconSize: 0.5,
                        // highlightColor: Colors.black45,
                      )
                    ]
                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(5, 5),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(imageUrl),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    mer,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                  SizedBox(height: 20),
                  Text(titles),
                  Text(desc),
                  SizedBox(height: 20),
                  Text(price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ) : Text(' ');
  }


  void incQuantity() {
    this.quantity = this.quantity + 1;
    // print(quantity);}
  }

  void decQuantity() {
    this.quantity = this.quantity - 1;
  }

}