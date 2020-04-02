
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/SignUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _visi=true;
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
                child: Text('Sign In',
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
                      padding:EdgeInsets.only(left: 15,right: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Your Email or Username',
                          contentPadding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
                          hintStyle:TextStyle( color:Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left: 15,right: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Password',
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
                  child: Text('Sign In',
                    style: TextStyle(
                        color:Colors.white,
                        fontSize:18),),
                ),
              ),
              Divider(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Don\'t have an account',style: TextStyle(
                      color: Colors.grey
                  ),),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: ()=>Navigator.push(
                      context,MaterialPageRoute(
                      builder:(_)=>SignUp(),
                    ),
                    ),
                    child: Text('Sign Up',
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
