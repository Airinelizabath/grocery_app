import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/cart.dart';
import 'grolist.dart';
import 'model.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: "GroceryApp",
        home: Home(),
        debugShowCheckedModeBanner: false,
    );
  }
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
                  FirstHalf(),
                  SizedBox(height: 5.0,),
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      'List',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  for(var groceryItem in groceryItemList.groceryitem)
                    itemContainer(groceryItem:groceryItem),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstHalf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(35, 25, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          SizedBox(height: 20.0),
          searchBar(),
          SizedBox(height: 20.0,),
          categories(),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
          GestureDetector(
            onTap: ()=>Navigator.push(
            context,MaterialPageRoute(
              builder:(_)=>OrderPage(),
            ),
              ),
            child:Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}

Widget searchBar(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Icon(
        Icons.search,
      ),
      SizedBox(width: 20,),
      Expanded(
        child: TextField(
            decoration: InputDecoration(
            hintText: 'Search...',
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            hintStyle:TextStyle( color:Colors.grey),
          ),
        ),
      ),
    ],
  );
}
//int selected=0;
Widget categories(){
  return Container(
    height: 150,
    child: ListView(
      scrollDirection: Axis.horizontal,
          children: <Widget>[
            CategoryListItem(
              categoryIcon:Icons.search,//avatar
              categoryName: "Vegetables",
               selected : true          ),
            CategoryListItem(
              categoryIcon:Icons.search,//avatar
              categoryName: "Diary Products",
               selected : false,
            ),
            CategoryListItem(
              categoryIcon:Icons.search,//avatar
              categoryName: "Fish",
               selected : false,
            ),
            CategoryListItem(
              categoryIcon:Icons.search,//avatar
              categoryName: "Foodgrains",
               selected : false,
            ),
            CategoryListItem(
              categoryIcon:Icons.search,//avatar
              categoryName: "Snacks",
              selected : false,
            ),
            CategoryListItem(
              categoryIcon:Icons.search,//avatar
              categoryName: "Beverages",
              selected : false,
            ),
          ],
    ),
  );
}
//bloc pattern: ^2.5.1
//rxdart: ^0.23.1
class CategoryListItem extends StatelessWidget {
  final IconData categoryIcon;
  final String categoryName;
   bool selected = false;
  void callFun(){
    for(var groceryItem in groceryItemList.groceryitem)
      itemContainer(groceryItem:groceryItem);
  }

  CategoryListItem(
      {@required this.categoryIcon,
       @required this.categoryName,
        @required this.selected,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            onTap: (){
             // setState((){
             //   _selected =! _selected;
            //  });
                callFun();
            },
            child: Container(
              height: 50,
              width: 50,
              //padding: EdgeInsets.all(20),
              child: IconButton(
                onPressed: (){
                },
                icon:Icon(Icons.search),
                color: selected?Colors.white:Colors.black,
                iconSize: 15,
              ),
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(50),
                 color: selected?Colors.black:Colors.white,
                 border: Border.all(
                   color: selected?Colors.transparent:Colors.grey,
                   width: 1.5,

                 ),
                 boxShadow:[
                   BoxShadow(
                     color: Colors.grey[500],
                     blurRadius: 15,
                     offset: Offset(5,10),
                     spreadRadius: 3,
                   )
                 ]
             ),


              ),
          ),
          Text(
              categoryName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selected?Colors.black:Colors.grey,
          ),),
        ],

      ),
    );

  }

}


