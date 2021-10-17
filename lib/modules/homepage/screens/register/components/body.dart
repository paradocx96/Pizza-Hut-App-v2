
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/homepage/models/authentication.dart';
import 'package:pizzahut/modules/homepage/screens/login/components/signup_button_white.dart';
import 'package:pizzahut/modules/homepage/screens/login/login_screen.dart';
//import 'package:pizzahut/modules/homepage/screens/login/components/forgot_password_check.dart';
import 'package:pizzahut/modules/homepage/screens/register/components/rounded_button_white.dart';
import 'package:pizzahut/modules/homepage/screens/login/components/signin_button_red.dart';
import 'package:provider/provider.dart';
//import 'package:pizzahut/modules/homepage/screens/gets_started/gets_started_screen.dart';
//import 'package:pizzahut/modules/homepage/screens/splash/splash_screen.dart';

import '../register_screen.dart';
import 'background.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  //TextEditingController _passwordController = new TextEditingController();
  bool isObscurePassword = true;

  Map<String, String> _authData = {
    'email' : '',
    'password': ''
  };

  void _showErrorDialog(String msg)
  {
    // showDialog(
    //     context: context,
    //     builder: (ctx) => AlertDialog(
    //       title: Text('Email already exist!'),
    //       content: Text(msg),
    //       actions: <Widget>[
    //         FlatButton(
    //           child: Text('Okay'),
    //           onPressed: (){
    //             Navigator.of(ctx).pop();
    //           },
    //         )
    //       ],
    //     )
    // );

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return CupertinoAlertDialog(
            title: const Text("Email already exist!"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(msg),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Try again")),
            ],
          );
        });
  }

  Future<void> _submit() async
  {
    print("------------- SUBMIT ---------------  ");
    // if(_formKey.currentState!.validate())
    // {
    //   return;
    // }
    _formKey.currentState!.save();

    String email = _authData['email'].toString();
    String password = _authData['password'].toString();
    try{
      await Provider.of<Authentication>(context, listen: false).signUp(
         email,
         password
         //  _authData['email'].toString(),
         //  _authData['password'].toString()
      );
      // Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) {
      //             return LoginScreen();
      //           },
      //         ),
      //       );

      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => LoginScreen(),
        ),
      );

    } catch(error)
    {
      var errorMessage = 'Authentication Failed, Please try another mail!';
      _showErrorDialog(errorMessage);
    }

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   // final ValueChanged<String> onChanged;
    IconData icon;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.28),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width * 0.01),
                  SignInButtonRed(
                      text: "Sign In",
                      press: (){
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return LoginScreen();
                        //     },
                        //   ),
                        // );

                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => LoginScreen(),
                          ),
                        );
                      }
                  ),
                  SizedBox(width: size.width * 0.01),
                  SignUpButtonWhite(
                      text: "Sign Up",
                      press: (){
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return RegisterScreen();
                        //     },
                        //   ),
                        // );
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => RegisterScreen(),
                          ),
                        );
                      }
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.12),

              // //email
              // TextFormField(
              //   // onChanged: onChanged,
              //   cursorColor: Colors.black54,
              //   keyboardType: TextInputType.emailAddress,
              //   decoration: InputDecoration(
              //     icon: Icon(
              //       icon = Icons.email,
              //       color: Colors.black54,
              //     ),
              //     hintText: 'Email',
              //     border: InputBorder.none,
              //   ),
              //   validator: (value) {
              //     // if(value!.isEmpty || value.contains('@'))
              //     // {
              //     //   return 'invalid email';
              //     // }
              //     return null;
              //   },
              //   onSaved: (value)
              //   {
              //     _authData['email'] = value!;
              //   },
              // ),
              //
              // //Address
              // TextFormField(
              //   // onChanged: onChanged,
              //   cursorColor: Colors.black54,
              //   decoration: InputDecoration(
              //     icon: Icon(
              //       icon = Icons.home,
              //       color: Colors.black54,
              //     ),
              //     hintText: 'Address',
              //     border: InputBorder.none,
              //   ),
              // ),
              //
              // //Phone
              // TextFormField(
              //   // onChanged: onChanged,
              //   cursorColor: Colors.black54,
              //   keyboardType: TextInputType.phone,
              //   decoration: InputDecoration(
              //     icon: Icon(
              //       icon = Icons.phone,
              //       color: Colors.black54,
              //     ),
              //     hintText: 'Phone',
              //     border: InputBorder.none,
              //   ),
              // ),
              //
              // //Password
              // TextFormField(
              //   obscureText: true,
              //   //onChanged: onChanged,
              //   cursorColor: Colors.black54,
              //   decoration: InputDecoration(
              //     hintText: "Password",
              //     icon: Icon(
              //       Icons.lock,
              //       color: Colors.black54,
              //     ),
              //     suffixIcon: Icon(
              //       Icons.visibility,
              //       color: Colors.black54,
              //     ),
              //     border: InputBorder.none,
              //   ),
              //   //controller: _passwordController,
              //   validator: (value)
              //   {
              //     if(value!.isEmpty || value.length<=5)
              //     {
              //       return 'invalid password';
              //     }
              //     return null;
              //   },
              //   onSaved: (value)
              //   {
              //     _authData['password'] = value!;
              //   },
              // ),
              //
              // RaisedButton(
              //   child: Text(
              //       'SIGN UP'
              //   ),
              //   onPressed: ()
              //   {
              //     _submit();
              //   },
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(30),
              //   ),
              //   color: Colors.redAccent,
              //   textColor: Colors.white,
              // ),

              Padding(
                padding: EdgeInsets.only(left: 38, top: 0, right: 38),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: const Icon(Icons.email, color: Colors.grey),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  color: Colors.grey
                              )
                          ),
                          validator: (value) {
                            if(value!.isEmpty)
                            {
                              return 'Invalid email!';
                            }
                            return null;
                          },
                          onSaved: (value)
                          {
                            _authData['email'] = value!;
                          },
                        ),
                    ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: EdgeInsets.only(left: 38, top: 0, right: 38),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: const Icon(Icons.home, color: Colors.grey),
                              labelText: 'Address',
                              labelStyle: TextStyle(
                                  color: Colors.grey
                              )
                          ),
                          validator: (value) {
                            if(value!.isEmpty || value.length<=5)
                            {
                              return 'Invalid address!';
                            }
                            return null;
                          },
                          onSaved: (value)
                          {
                            //_authData['address'] = value!;
                          },
                        ),
                    ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: EdgeInsets.only(left: 38, top: 0, right: 38),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: const Icon(Icons.phone, color: Colors.grey),
                              labelText: 'Phone',
                              labelStyle: TextStyle(
                                  color: Colors.grey
                              )
                          ),
                          validator: (value) {
                            if(value!.isEmpty)
                            {
                              return 'Invalid phone!';
                            }else if(value.length>11){
                              return 'Phone number should contain 10 digits!';
                            }
                            return null;
                          },
                          onSaved: (value)
                          {
                           // _authData['phone'] = value!;
                          },
                        ),
                    ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: EdgeInsets.only(left: 38, top: 0, right: 38),
                child: Stack(
                  alignment: const Alignment(0, 0),
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding:
                          EdgeInsets.only(left: 15, right: 15, top: 0),
                          child: TextFormField(
                            obscureText: true ? isObscurePassword : false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: const Icon(Icons.lock, color: Colors.grey,),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.grey
                              ),
                            ),
                            validator: (value)
                            {
                              if(value!.isEmpty || value.length<=5)
                              {
                                return 'Invalid password!';
                              }
                              return null;
                            },
                            onSaved: (value)
                            {
                              _authData['password'] = value!;
                            },
                          ),
                        ),
                    ),
                    Positioned(
                      right: 15,
                      child: IconButton(
                          icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                          onPressed: (){
                            setState(() {
                              isObscurePassword = !isObscurePassword;
                            });
                          }
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                  padding: EdgeInsets.only(left: 25, top: 0, right: 25),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                      child: Container(
                        decoration: BoxDecoration(
                          //borderRadius : new BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: RaisedButton(
                          color: Colors.redAccent,
                          splashColor: Colors.white,
                          onPressed: () {
                            // Validate returns true if the form is valid, or false
                            // otherwise.
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a Snackbar.
                              _submit();
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Creating Account!',textAlign: TextAlign.center,),
                                    backgroundColor: Colors.grey,
                                  )
                              );
                            }
                          },
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w700),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              side: BorderSide(color: Colors.white)
                          ),
                        ),
                      ),
                    ),
                  )
              ),

              SizedBox(height: size.height * 0.02),
               Text(
                  "OR",
                  style: TextStyle(fontWeight: FontWeight.normal,fontSize: 25),

              ),
              SizedBox(height: size.height * 0.02),
              RoundedButtonWhite(
                text: "Sign up with Google",
                press: () {},
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}