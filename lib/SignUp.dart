
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/SignIn.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _visi=true;
  bool _visii=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:0,left: 0),
                child: Text('Sign Up',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              SizedBox(height: 40),
              Align(
                child: Text('Forgot Password',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),),
                alignment: Alignment.topRight,),
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:EdgeInsets.only(left: 20,right: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Your Email or Username',
                          contentPadding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
                          hintStyle:TextStyle( color:Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left: 20,right: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText:'Password',
                          contentPadding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
                          hintStyle:TextStyle( color:Colors.grey),
                          suffixIcon:IconButton(
                            onPressed: (){
                              setState(() {
                                _visi =! _visi;
                              });
                            },
                            icon: _visi?Icon(Icons.visibility_off, color: Colors.grey,):Icon(Icons.visibility),
                          ),
                        ),
                        obscureText:_visi,
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left:20,right: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          contentPadding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
                          hintStyle:TextStyle( color:Colors.grey),
                          suffixIcon:IconButton(
                            onPressed: (){
                              setState(() {
                                _visii =! _visii;
                              });
                            },
                            icon: _visii?Icon(Icons.visibility_off, color: Colors.grey,):Icon(Icons.visibility),
                          ),
                        ),
                        obscureText:_visii,
                      ),
                    ),
                    SizedBox(height: 20)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text('Sign Up',
                    style: TextStyle(
                        color:Colors.white,
                        fontSize:18),),
                ),
              ),
              Divider(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Account already exist',style: TextStyle(
                      color: Colors.grey
                  ),),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: ()=>Navigator.push(
                      context,MaterialPageRoute(
                      builder:(_)=>SignIn(),
                    ),
                    ),
                    child: Text('Sign In',
                      style: TextStyle(
                          color: Colors.blueAccent
                      ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
